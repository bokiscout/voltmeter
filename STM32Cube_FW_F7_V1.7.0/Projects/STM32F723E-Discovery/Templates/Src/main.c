/**
 ******************************************************************************
 * @file    Templates/Src/main.c
 * @author  MCD Application Team
 * @version V1.0.0
 * @date    30-December-2016
 * @brief   STM32F7xx HAL API Template project
 ******************************************************************************
 * @attention
 *
 * <h2><center>&copy; COPYRIGHT(c) 2016 STMicroelectronics</center></h2>
 *
 * Redistribution and use in source and binary forms, with or without modification,
 * are permitted provided that the following conditions are met:
 *   1. Redistributions of source code must retain the above copyright notice,
 *      this list of conditions and the following disclaimer.
 *   2. Redistributions in binary form must reproduce the above copyright notice,
 *      this list of conditions and the following disclaimer in the documentation
 *      and/or other materials provided with the distribution.
 *   3. Neither the name of STMicroelectronics nor the names of its contributors
 *      may be used to endorse or promote products derived from this software
 *      without specific prior written permission.
 *
 * THIS SOFTWARE IS PROVIDED BY THE COPYRIGHT HOLDERS AND CONTRIBUTORS "AS IS"
 * AND ANY EXPRESS OR IMPLIED WARRANTIES, INCLUDING, BUT NOT LIMITED TO, THE
 * IMPLIED WARRANTIES OF MERCHANTABILITY AND FITNESS FOR A PARTICULAR PURPOSE ARE
 * DISCLAIMED. IN NO EVENT SHALL THE COPYRIGHT HOLDER OR CONTRIBUTORS BE LIABLE
 * FOR ANY DIRECT, INDIRECT, INCIDENTAL, SPECIAL, EXEMPLARY, OR CONSEQUENTIAL
 * DAMAGES (INCLUDING, BUT NOT LIMITED TO, PROCUREMENT OF SUBSTITUTE GOODS OR
 * SERVICES; LOSS OF USE, DATA, OR PROFITS; OR BUSINESS INTERRUPTION) HOWEVER
 * CAUSED AND ON ANY THEORY OF LIABILITY, WHETHER IN CONTRACT, STRICT LIABILITY,
 * OR TORT (INCLUDING NEGLIGENCE OR OTHERWISE) ARISING IN ANY WAY OUT OF THE USE
 * OF THIS SOFTWARE, EVEN IF ADVISED OF THE POSSIBILITY OF SUCH DAMAGE.
 *
 ******************************************************************************
 */

/* Includes ------------------------------------------------------------------*/
#include "main.h"
#include "stm32f7xx_hal.h"
#include "stm32f723e_discovery.h"
#include "stm32f723e_discovery_lcd.h"
#include "stm32f723e_discovery_ts.h"

/* Definition for ADCx clock resources */
#define ADCx                            ADC3
#define ADCx_CLK_ENABLE()               __HAL_RCC_ADC3_CLK_ENABLE()
#define ADCx_CHANNEL_GPIO_CLK_ENABLE()  __HAL_RCC_GPIOF_CLK_ENABLE()

#define ADCx_FORCE_RESET()              __HAL_RCC_ADC_FORCE_RESET()
#define ADCx_RELEASE_RESET()            __HAL_RCC_ADC_RELEASE_RESET()

/* Definition for ADCx Channel Pin */
#define ADCx_CHANNEL_PIN                GPIO_PIN_10
#define ADCx_CHANNEL_GPIO_PORT          GPIOF

/* Definition for ADCx's Channel */
#define ADCx_CHANNEL                    ADC_CHANNEL_8

/* Definition for ADCx's NVIC */
#define ADCx_IRQn                       ADC_IRQn

/* Definition for ADCx's DMA */
#define ADCx_DMA_CHANNEL                DMA_CHANNEL_2
#define ADCx_DMA_STREAM                 DMA2_Stream0

/* Definition for ADCx's NVIC */
#define ADCx_DMA_IRQn                   DMA2_Stream0_IRQn
#define ADCx_DMA_IRQHandler             DMA2_Stream0_IRQHandler

/* number of digits to be displayed on the LCD */
#define DIGITS							5

/* number of measurement to get average from */
#define AVG_ON_PAST						5

static int16_t aPhysX[2], aPhysY[2], aLogX[2], aLogY[2];

/* Global variables ---------------------------------------------------------*/
TS_StateTypeDef TS_State = { 0 };

/** @addtogroup STM32F7xx_HAL_Examples
 * @{
 */

/** @addtogroup Templates
 * @{
 */

/* Private typedef -----------------------------------------------------------*/
/* Private define ------------------------------------------------------------*/
/* Private macro -------------------------------------------------------------*/
/* Private variables ---------------------------------------------------------*/
/* Variable used to get converted value */
__IO uint16_t uhADCxConvertedValue = 0;

/* ADC handler declaration */
ADC_HandleTypeDef AdcHandle;

/* buffer used while converting the integer to string for displaying filtered Input Voltage */
char buff[10];

/* store corrected value for Input Voltage */
float volts = 0;
float volts_previous = 0;
float volts_array[AVG_ON_PAST];
int volts_array_position = 0;

/* Private function prototypes -----------------------------------------------*/
static void SystemClock_Config(void);
static void Error_Handler(void);
static void MPU_Config(void);
static void CPU_CACHE_Enable(void);
void display_welcome_message(void);
void DMA_ADC_Config(void);
void LEDS_Init(void);
void LCD_Init(void);
float map(uint16_t volt);
uint8_t volts_to_string(float volts, char* s);
float average(float *volts_array);
void TS_Init(void);

uint8_t Touchscreen_Calibration(void);
uint8_t CheckForUserInput(void);

/* Private functions ---------------------------------------------------------*/
void TS_Init(){
	BSP_TS_Init(BSP_LCD_GetXSize(), BSP_LCD_GetYSize());
}

float map(uint16_t volt) {
//	float greska = 0;
//	float result = 0;
//
//	greska = volt * volt * 0.05 / 1000.0;
//	result = (((volt - greska) / 1000.0) - 0.05);
//
//	return result;

// thank you WolframAplha =)
// but no thanks
	return 0.0000111415 * (volt * volt) - (0.00524878 * volt) - 1.98671;
}

float average(float *volts_array) {
	float result = 0;
	float total_weights = 0;
	float current_weight = 0;
	int i;

	for (i = 0; i < AVG_ON_PAST; i++) {
		current_weight = (AVG_ON_PAST - (AVG_ON_PAST - i ) + 1) / 10.0;
		result += volts_array[i] * current_weight;

		total_weights += current_weight;
	}

	result /= total_weights;

	return result;
}

void display_welcome_message() {
	BSP_LCD_SetTextColor(LCD_COLOR_BLUE);
	BSP_LCD_FillRect(0, BSP_LCD_GetYSize() / 2 - 20, BSP_LCD_GetXSize(), 60);

	BSP_LCD_SetBackColor(LCD_COLOR_BLUE);
	BSP_LCD_SetTextColor(LCD_COLOR_WHITE);
	BSP_LCD_DisplayStringAt(0, BSP_LCD_GetYSize() - 120, (uint8_t*) "Welcome",
			CENTER_MODE);

	BSP_LCD_SetBackColor(LCD_COLOR_WHITE);
	BSP_LCD_SetTextColor(LCD_COLOR_BLUE);

	HAL_Delay(1000);
	BSP_LCD_Clear(LCD_COLOR_WHITE);
}

void LEDS_Init() {
	BSP_LED_Init(LED5);
	BSP_LED_Init(LED6);

	BSP_LED_Off(LED5);
	BSP_LED_Off(LED6);
}

void LCD_Init() {
	BSP_LCD_Init();
	BSP_LCD_SetFont(&Font24);
	BSP_LCD_SetBackColor(LCD_COLOR_WHITE);
	BSP_LCD_Clear(LCD_COLOR_WHITE);
	BSP_LCD_SetTextColor(LCD_COLOR_BLACK);
}

void DMA_ADC_Config() {
	ADC_ChannelConfTypeDef sConfig;

	AdcHandle.Instance = ADCx;

//	if(HAL_ADC_DeInit(&AdcHandle) != HAL_OK){
//		Error_Handler();
//	}

	AdcHandle.Init.ClockPrescaler = ADC_CLOCKPRESCALER_PCLK_DIV4;
	AdcHandle.Init.Resolution = ADC_RESOLUTION_12B;
	AdcHandle.Init.ScanConvMode = DISABLE; /* Sequencer disabled (ADC conversion on only 1 channel: channel set on rank 1) */
	AdcHandle.Init.ContinuousConvMode = ENABLE; /* Continuous mode disabled to have only 1 conversion at each conversion trig */
	AdcHandle.Init.DiscontinuousConvMode = DISABLE; /* Parameter discarded because sequencer is disabled */
	AdcHandle.Init.NbrOfDiscConversion = 0;
	AdcHandle.Init.ExternalTrigConvEdge = ADC_EXTERNALTRIGCONVEDGE_NONE; /* Conversion start trigged at each external event */
	AdcHandle.Init.ExternalTrigConv = ADC_EXTERNALTRIGCONV_T1_CC1;
	AdcHandle.Init.DataAlign = ADC_DATAALIGN_RIGHT;
	AdcHandle.Init.NbrOfConversion = 1;
	AdcHandle.Init.DMAContinuousRequests = ENABLE;
	AdcHandle.Init.EOCSelection = DISABLE;

	if (HAL_ADC_Init(&AdcHandle) != HAL_OK) {
		/* ADC initialization Error */
		Error_Handler();
	}

	/*##-2- Configure ADC regular channel ######################################*/
	sConfig.Channel = ADC_CHANNEL_8;
	sConfig.Rank = 1;
	sConfig.SamplingTime = ADC_SAMPLETIME_15CYCLES;
	sConfig.Offset = 0;

	if (HAL_ADC_ConfigChannel(&AdcHandle, &sConfig) != HAL_OK) {
		/* Channel Configuration Error */
		Error_Handler();
	}

	/*##-3- Start the conversion process #######################################*/
	if (HAL_ADC_Start_DMA(&AdcHandle, (uint32_t*) &uhADCxConvertedValue, 1)
			!= HAL_OK) {
		/* Start Conversation Error */
		Error_Handler();
	}
}

// callback for ADC
//void HAL_ADC_ConvCpltCallback(ADC_HandleTypeDef* AdcHandle)
//{
//  /* Get the converted value of regular channel */
//	//uhADCxConvertedValue = HAL_ADC_GetValue(AdcHandle);
//}

/**
 * @brief  System Clock Configuration
 *         The system Clock is configured as follow :
 *            System Clock source            = PLL (HSE)
 *            SYSCLK(Hz)                     = 216000000
 *            HCLK(Hz)                       = 216000000
 *            AHB Prescaler                  = 1
 *            APB1 Prescaler                 = 4
 *            APB2 Prescaler                 = 2
 *            HSE Frequency(Hz)              = 25000000
 *            PLL_M                          = 25
 *            PLL_N                          = 432
 *            PLL_P                          = 2
 *            PLL_Q                          = 9
 *            VDD(V)                         = 3.3
 *            Main regulator output voltage  = Scale1 mode
 *            Flash Latency(WS)              = 7
 * @param  None
 * @retval None
 */
static void SystemClock_Config(void) {
	RCC_ClkInitTypeDef RCC_ClkInitStruct;
	RCC_OscInitTypeDef RCC_OscInitStruct;

	/* Enable HSE Oscillator and activate PLL with HSE as source */
	RCC_OscInitStruct.OscillatorType = RCC_OSCILLATORTYPE_HSE;
	RCC_OscInitStruct.HSEState = RCC_HSE_ON;
	//RCC_OscInitStruct.HSIState = RCC_HSI_OFF;
	RCC_OscInitStruct.PLL.PLLState = RCC_PLL_ON;
	RCC_OscInitStruct.PLL.PLLSource = RCC_PLLSOURCE_HSE;
	RCC_OscInitStruct.PLL.PLLM = 25;
	RCC_OscInitStruct.PLL.PLLN = 432;
	RCC_OscInitStruct.PLL.PLLP = RCC_PLLP_DIV2;
	RCC_OscInitStruct.PLL.PLLQ = 9;
	if (HAL_RCC_OscConfig(&RCC_OscInitStruct) != HAL_OK) {
		Error_Handler();
	}

	/* activate the OverDrive to reach the 216 Mhz Frequency */
	if (HAL_PWREx_EnableOverDrive() != HAL_OK) {
		Error_Handler();
	}

	/* Select PLL as system clock source and configure the HCLK, PCLK1 and PCLK2
	 clocks dividers */
	RCC_ClkInitStruct.ClockType = (RCC_CLOCKTYPE_SYSCLK | RCC_CLOCKTYPE_HCLK
			| RCC_CLOCKTYPE_PCLK1 | RCC_CLOCKTYPE_PCLK2);
	RCC_ClkInitStruct.SYSCLKSource = RCC_SYSCLKSOURCE_PLLCLK;
	RCC_ClkInitStruct.AHBCLKDivider = RCC_SYSCLK_DIV1;
	RCC_ClkInitStruct.APB1CLKDivider = RCC_HCLK_DIV4;
	RCC_ClkInitStruct.APB2CLKDivider = RCC_HCLK_DIV2;
	if (HAL_RCC_ClockConfig(&RCC_ClkInitStruct, FLASH_LATENCY_7) != HAL_OK) {
		Error_Handler();
	}
}

/**
 * @brief  This function is executed in case of error occurrence.
 * @param  None
 * @retval None
 */
static void Error_Handler(void) {
	/* User may add here some code to deal with this error */
	BSP_LED_On(LED5);
}

/**
 * @brief  Configure the MPU attributes as Write Through for SRAM1/2.
 * @note   The Base Address is 0x20010000 since this memory interface is the AXI.
 *         The Region Size is 256KB, it is related to SRAM1 and SRAM2  memory size.
 * @param  None
 * @retval None
 */
static void MPU_Config(void) {
	MPU_Region_InitTypeDef MPU_InitStruct;

	/* Disable the MPU */
	HAL_MPU_Disable();

	/* Configure the MPU attributes as WT for SRAM */
	MPU_InitStruct.Enable = MPU_REGION_ENABLE;

	//  MPU_InitStruct.BaseAddress = 0x20010000;
	MPU_InitStruct.BaseAddress = 0x64000000;

	//MPU_InitStruct.Size = MPU_REGION_SIZE_256KB;
	MPU_InitStruct.Size = MPU_REGION_SIZE_512KB;

	MPU_InitStruct.AccessPermission = MPU_REGION_FULL_ACCESS;

	//  MPU_InitStruct.IsBufferable = MPU_ACCESS_NOT_BUFFERABLE;
	MPU_InitStruct.IsBufferable = MPU_ACCESS_BUFFERABLE;

	MPU_InitStruct.IsCacheable = MPU_ACCESS_CACHEABLE;
	MPU_InitStruct.IsShareable = MPU_ACCESS_SHAREABLE;
	MPU_InitStruct.Number = MPU_REGION_NUMBER0;
	MPU_InitStruct.TypeExtField = MPU_TEX_LEVEL0;
	MPU_InitStruct.SubRegionDisable = 0x00;
	MPU_InitStruct.DisableExec = MPU_INSTRUCTION_ACCESS_ENABLE;

	HAL_MPU_ConfigRegion(&MPU_InitStruct);

	// added by me start here:
	MPU_InitStruct.BaseAddress = 0x6000000;
	MPU_InitStruct.Number = MPU_REGION_NUMBER1;
	HAL_MPU_ConfigRegion(&MPU_InitStruct);
	// added by me end here:

	/* Enable the MPU */
	HAL_MPU_Enable(MPU_PRIVILEGED_DEFAULT);
}

/**
 * @brief  CPU L1-Cache enable.
 * @param  None
 * @retval None
 */
static void CPU_CACHE_Enable(void) {
	/* Enable I-Cache */
	SCB_EnableICache();

	/* Enable D-Cache */
	SCB_EnableDCache();
}

uint8_t volts_to_string(float volts, char* s) {
	uint8_t len = 0;
	float volts_abs = (volts < 0) ? -volts : volts;

	int volts_int_part = volts_abs;                  	// Get as integer (abs)
	float volts_temp_fraction = volts_abs - volts_int_part; // Get fraction (0.01234).
	int volts_fraction_part = trunc(volts_temp_fraction * 10000); // Turn into integer (1234)

//	do {
//		s[len++] = '0' + volts_int_part % 10;
//		volts_int_part /= 10;
//	} while (volts_int_part);
	if (volts_int_part >= 10) {
		s[len++] = '0' + volts_int_part / 10 % 10;
	}
	s[len++] = '0' + volts_int_part % 10;

	s[len] = '.';

	if (volts_fraction_part >= 1000) {
		s[++len] = '0' + volts_fraction_part / 1000;
		s[++len] = '0' + (volts_fraction_part % 1000) / 100;
	} else if ((volts_fraction_part >= 100) && (volts_fraction_part < 1000)) {
		s[++len] = '0';
		s[++len] = '0' + (volts_fraction_part % 1000) / 100;
	} else if (volts_fraction_part < 100) {
		s[++len] = '0';
		s[++len] = '0';
	}

	// add measurement unit
	s[++len] = ' ';
	s[++len] = 'V';

	s[++len] = 0;
	return len;
} // volts_to_string

/*  Magic */
uint8_t Touchscreen_Calibration(void) {
	uint8_t ts_status = TS_OK;
	uint8_t i;

	/* Get touch points for SW calibration processing */
	aLogX[0] = 20;
	aLogY[0] = 20;
	aLogX[1] = BSP_LCD_GetXSize() - 20;
	aLogY[1] = BSP_LCD_GetYSize() - 20;

	for (i = 0; i < 2; i++) {
		TouchScreen_Calibration_GetPhysValues(aLogX[i], aLogY[i], &aPhysX[i],
				&aPhysY[i]);
	}

	return (ts_status);
}

/**
 * @brief  Check for user input.
 * @param  None
 * @retval Input state (1 : active / 0 : Inactive)
 */
uint8_t CheckForUserInput(void) {
	if (BSP_PB_GetState(BUTTON_WAKEUP) != RESET) {
		HAL_Delay(10);
		while (BSP_PB_GetState(BUTTON_WAKEUP) != RESET)
			;
		return 1;
	}
	return 0;
}

/**
 * @brief  Main program
 * @param  None
 * @retval None
 */
int main(void) {
	/* This project template calls firstly two functions in order to configure MPU feature
	 and to enable the CPU Cache, respectively MPU_Config() and CPU_CACHE_Enable().
	 These functions are provided as template implementation that User may integrate
	 in his application, to enhance the performance in case of use of AXI interface
	 with several masters. */

	/* Configure the MPU attributes as Write Through */
	MPU_Config();

	/* Enable the CPU Cache */
	CPU_CACHE_Enable();

	/* STM32F7xx HAL library initialization:
	 - Configure the Flash ART accelerator on ITCM interface
	 - Configure the Systick to generate an interrupt each 1 msec
	 - Set NVIC Group Priority to 4
	 - Low Level Initialization
	 */
	HAL_Init();

	/* Configure the System clock to have a frequency of 216 MHz */
	SystemClock_Config();

	LEDS_Init();
	LCD_Init();
	TS_Init();
	display_welcome_message();
//	HAL_Delay(600);

	DMA_ADC_Config();

	BSP_LCD_Clear(LCD_COLOR_WHITE);
	BSP_LCD_SetFont(&Font24);
	BSP_LCD_SetBackColor(LCD_COLOR_WHITE);
	BSP_LCD_Clear(LCD_COLOR_WHITE);
	BSP_LCD_SetTextColor(LCD_COLOR_BLACK);

	/* Infinite loop */
	while (1) {
		BSP_LED_Toggle(LED5);

		BSP_TS_GetState(&TS_State);
		if (TS_State.touchDetected) {
			BSP_LED_Toggle(LED6);
			HAL_Delay(250);
			BSP_LED_Toggle(LED6);
		}

		volts_array[volts_array_position] = map(uhADCxConvertedValue);
		volts_array_position++;

		if (volts_array_position == AVG_ON_PAST) {
			volts_array_position = 0;

			volts_previous = volts;

			volts = average(volts_array);
			volts_to_string(volts, buff);

			if (volts_previous >= 10 && volts < 10) {
				BSP_LCD_Clear(LCD_COLOR_WHITE);
			}
		}

		BSP_LCD_DisplayStringAt(0, BSP_LCD_GetYSize() - 120, (uint8_t *) buff,CENTER_MODE);
		HAL_Delay(100);
	}
}

#ifdef  USE_FULL_ASSERT

/**
 * @brief  Reports the name of the source file and the source line number
 *         where the assert_param error has occurred.
 * @param  file: pointer to the source file name
 * @param  line: assert_param error line source number
 * @retval None
 */
void assert_failed(uint8_t* file, uint32_t line)
{
	/* User can add his own implementation to report the file name and line number,
	 ex: printf("Wrong parameters value: file %s on line %d\r\n", file, line) */

	/* Infinite loop */
	while (1)
	{
	}
}
#endif

/************************ (C) COPYRIGHT STMicroelectronics *****END OF FILE****/
