################################################################################
# Automatically-generated file. Do not edit!
################################################################################

# Add inputs and outputs from these tool invocations to the build variables 
C_SRCS += \
/mnt/Data_WD/google-drive/embeded-summer-school-borche/voltmeter/STM32Cube_FW_F7_V1.7.0/Projects/STM32F723E-Discovery/Templates/Src/system_stm32f7xx.c 

OBJS += \
./Drivers/CMSIS/system_stm32f7xx.o 

C_DEPS += \
./Drivers/CMSIS/system_stm32f7xx.d 


# Each subdirectory must supply rules for building sources it contributes
Drivers/CMSIS/system_stm32f7xx.o: /mnt/Data_WD/google-drive/embeded-summer-school-borche/voltmeter/STM32Cube_FW_F7_V1.7.0/Projects/STM32F723E-Discovery/Templates/Src/system_stm32f7xx.c
	@echo 'Building file: $<'
	@echo 'Invoking: MCU GCC Compiler'
	@echo $(PWD)
	arm-none-eabi-gcc -mcpu=cortex-m7 -mthumb -mfloat-abi=hard -mfpu=fpv5-sp-d16 -DUSE_HAL_DRIVER -DSTM32F723xx -I"/mnt/Data_WD/google-drive/embeded-summer-school-borche/voltmeter/STM32Cube_FW_F7_V1.7.0/Projects/STM32F723E-Discovery/Templates/Inc" -I"/mnt/Data_WD/google-drive/embeded-summer-school-borche/voltmeter/STM32Cube_FW_F7_V1.7.0/Drivers/CMSIS/Device/ST/STM32F7xx/Include" -I"/mnt/Data_WD/google-drive/embeded-summer-school-borche/voltmeter/STM32Cube_FW_F7_V1.7.0/Drivers/STM32F7xx_HAL_Driver/Inc" -I"/mnt/Data_WD/google-drive/embeded-summer-school-borche/voltmeter/STM32Cube_FW_F7_V1.7.0/Drivers/BSP/STM32F723E-Discovery" -I"/mnt/Data_WD/google-drive/embeded-summer-school-borche/voltmeter/STM32Cube_FW_F7_V1.7.0/Drivers/BSP/Components/Common" -I"/mnt/Data_WD/google-drive/embeded-summer-school-borche/voltmeter/STM32Cube_FW_F7_V1.7.0/Utilities/Log" -I"/mnt/Data_WD/google-drive/embeded-summer-school-borche/voltmeter/STM32Cube_FW_F7_V1.7.0/Utilities/Fonts" -I"/mnt/Data_WD/google-drive/embeded-summer-school-borche/voltmeter/STM32Cube_FW_F7_V1.7.0/Utilities/CPU" -I"/mnt/Data_WD/google-drive/embeded-summer-school-borche/voltmeter/STM32Cube_FW_F7_V1.7.0/Drivers/CMSIS/Include"  -Os -g3 -Wall -fmessage-length=0 -Wno-strict-aliasing -ffunction-sections -c -fmessage-length=0 -MMD -MP -MF"$(@:%.o=%.d)" -MT"$@" -o "$@" "$<"
	@echo 'Finished building: $<'
	@echo ' '


