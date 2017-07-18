################################################################################
# Automatically-generated file. Do not edit!
################################################################################

# Add inputs and outputs from these tool invocations to the build variables 
C_SRCS += \
/mnt/Data_WD/google-drive/embeded-summer-school-borche/voltmeter/STM32Cube_FW_F7_V1.7.0/Drivers/BSP/STM32F723E-Discovery/stm32f723e_discovery.c \
/mnt/Data_WD/google-drive/embeded-summer-school-borche/voltmeter/STM32Cube_FW_F7_V1.7.0/Drivers/BSP/STM32F723E-Discovery/stm32f723e_discovery_audio.c \
/mnt/Data_WD/google-drive/embeded-summer-school-borche/voltmeter/STM32Cube_FW_F7_V1.7.0/Drivers/BSP/STM32F723E-Discovery/stm32f723e_discovery_lcd.c \
/mnt/Data_WD/google-drive/embeded-summer-school-borche/voltmeter/STM32Cube_FW_F7_V1.7.0/Drivers/BSP/STM32F723E-Discovery/stm32f723e_discovery_psram.c \
/mnt/Data_WD/google-drive/embeded-summer-school-borche/voltmeter/STM32Cube_FW_F7_V1.7.0/Drivers/BSP/STM32F723E-Discovery/stm32f723e_discovery_qspi.c \
/mnt/Data_WD/google-drive/embeded-summer-school-borche/voltmeter/STM32Cube_FW_F7_V1.7.0/Drivers/BSP/STM32F723E-Discovery/stm32f723e_discovery_ts.c 

OBJS += \
./Drivers/BSP/STM32F769I_DISCOVERY/stm32f723e_discovery.o \
./Drivers/BSP/STM32F769I_DISCOVERY/stm32f723e_discovery_audio.o \
./Drivers/BSP/STM32F769I_DISCOVERY/stm32f723e_discovery_lcd.o \
./Drivers/BSP/STM32F769I_DISCOVERY/stm32f723e_discovery_psram.o \
./Drivers/BSP/STM32F769I_DISCOVERY/stm32f723e_discovery_qspi.o \
./Drivers/BSP/STM32F769I_DISCOVERY/stm32f723e_discovery_ts.o 

C_DEPS += \
./Drivers/BSP/STM32F769I_DISCOVERY/stm32f723e_discovery.d \
./Drivers/BSP/STM32F769I_DISCOVERY/stm32f723e_discovery_audio.d \
./Drivers/BSP/STM32F769I_DISCOVERY/stm32f723e_discovery_lcd.d \
./Drivers/BSP/STM32F769I_DISCOVERY/stm32f723e_discovery_psram.d \
./Drivers/BSP/STM32F769I_DISCOVERY/stm32f723e_discovery_qspi.d \
./Drivers/BSP/STM32F769I_DISCOVERY/stm32f723e_discovery_ts.d 


# Each subdirectory must supply rules for building sources it contributes
Drivers/BSP/STM32F769I_DISCOVERY/stm32f723e_discovery.o: /mnt/Data_WD/google-drive/embeded-summer-school-borche/voltmeter/STM32Cube_FW_F7_V1.7.0/Drivers/BSP/STM32F723E-Discovery/stm32f723e_discovery.c
	@echo 'Building file: $<'
	@echo 'Invoking: MCU GCC Compiler'
	@echo $(PWD)
	arm-none-eabi-gcc -mcpu=cortex-m7 -mthumb -mfloat-abi=hard -mfpu=fpv5-sp-d16 -DUSE_HAL_DRIVER -DSTM32F723xx -I"/mnt/Data_WD/google-drive/embeded-summer-school-borche/voltmeter/STM32Cube_FW_F7_V1.7.0/Projects/STM32F723E-Discovery/Templates/Inc" -I"/mnt/Data_WD/google-drive/embeded-summer-school-borche/voltmeter/STM32Cube_FW_F7_V1.7.0/Drivers/CMSIS/Device/ST/STM32F7xx/Include" -I"/mnt/Data_WD/google-drive/embeded-summer-school-borche/voltmeter/STM32Cube_FW_F7_V1.7.0/Drivers/STM32F7xx_HAL_Driver/Inc" -I"/mnt/Data_WD/google-drive/embeded-summer-school-borche/voltmeter/STM32Cube_FW_F7_V1.7.0/Drivers/BSP/STM32F723E-Discovery" -I"/mnt/Data_WD/google-drive/embeded-summer-school-borche/voltmeter/STM32Cube_FW_F7_V1.7.0/Drivers/BSP/Components/Common" -I"/mnt/Data_WD/google-drive/embeded-summer-school-borche/voltmeter/STM32Cube_FW_F7_V1.7.0/Utilities/Log" -I"/mnt/Data_WD/google-drive/embeded-summer-school-borche/voltmeter/STM32Cube_FW_F7_V1.7.0/Utilities/Fonts" -I"/mnt/Data_WD/google-drive/embeded-summer-school-borche/voltmeter/STM32Cube_FW_F7_V1.7.0/Utilities/CPU" -I"/mnt/Data_WD/google-drive/embeded-summer-school-borche/voltmeter/STM32Cube_FW_F7_V1.7.0/Drivers/CMSIS/Include"  -Os -g3 -Wall -fmessage-length=0 -Wno-strict-aliasing -ffunction-sections -c -fmessage-length=0 -MMD -MP -MF"$(@:%.o=%.d)" -MT"$@" -o "$@" "$<"
	@echo 'Finished building: $<'
	@echo ' '

Drivers/BSP/STM32F769I_DISCOVERY/stm32f723e_discovery_audio.o: /mnt/Data_WD/google-drive/embeded-summer-school-borche/voltmeter/STM32Cube_FW_F7_V1.7.0/Drivers/BSP/STM32F723E-Discovery/stm32f723e_discovery_audio.c
	@echo 'Building file: $<'
	@echo 'Invoking: MCU GCC Compiler'
	@echo $(PWD)
	arm-none-eabi-gcc -mcpu=cortex-m7 -mthumb -mfloat-abi=hard -mfpu=fpv5-sp-d16 -DUSE_HAL_DRIVER -DSTM32F723xx -I"/mnt/Data_WD/google-drive/embeded-summer-school-borche/voltmeter/STM32Cube_FW_F7_V1.7.0/Projects/STM32F723E-Discovery/Templates/Inc" -I"/mnt/Data_WD/google-drive/embeded-summer-school-borche/voltmeter/STM32Cube_FW_F7_V1.7.0/Drivers/CMSIS/Device/ST/STM32F7xx/Include" -I"/mnt/Data_WD/google-drive/embeded-summer-school-borche/voltmeter/STM32Cube_FW_F7_V1.7.0/Drivers/STM32F7xx_HAL_Driver/Inc" -I"/mnt/Data_WD/google-drive/embeded-summer-school-borche/voltmeter/STM32Cube_FW_F7_V1.7.0/Drivers/BSP/STM32F723E-Discovery" -I"/mnt/Data_WD/google-drive/embeded-summer-school-borche/voltmeter/STM32Cube_FW_F7_V1.7.0/Drivers/BSP/Components/Common" -I"/mnt/Data_WD/google-drive/embeded-summer-school-borche/voltmeter/STM32Cube_FW_F7_V1.7.0/Utilities/Log" -I"/mnt/Data_WD/google-drive/embeded-summer-school-borche/voltmeter/STM32Cube_FW_F7_V1.7.0/Utilities/Fonts" -I"/mnt/Data_WD/google-drive/embeded-summer-school-borche/voltmeter/STM32Cube_FW_F7_V1.7.0/Utilities/CPU" -I"/mnt/Data_WD/google-drive/embeded-summer-school-borche/voltmeter/STM32Cube_FW_F7_V1.7.0/Drivers/CMSIS/Include"  -Os -g3 -Wall -fmessage-length=0 -Wno-strict-aliasing -ffunction-sections -c -fmessage-length=0 -MMD -MP -MF"$(@:%.o=%.d)" -MT"$@" -o "$@" "$<"
	@echo 'Finished building: $<'
	@echo ' '

Drivers/BSP/STM32F769I_DISCOVERY/stm32f723e_discovery_lcd.o: /mnt/Data_WD/google-drive/embeded-summer-school-borche/voltmeter/STM32Cube_FW_F7_V1.7.0/Drivers/BSP/STM32F723E-Discovery/stm32f723e_discovery_lcd.c
	@echo 'Building file: $<'
	@echo 'Invoking: MCU GCC Compiler'
	@echo $(PWD)
	arm-none-eabi-gcc -mcpu=cortex-m7 -mthumb -mfloat-abi=hard -mfpu=fpv5-sp-d16 -DUSE_HAL_DRIVER -DSTM32F723xx -I"/mnt/Data_WD/google-drive/embeded-summer-school-borche/voltmeter/STM32Cube_FW_F7_V1.7.0/Projects/STM32F723E-Discovery/Templates/Inc" -I"/mnt/Data_WD/google-drive/embeded-summer-school-borche/voltmeter/STM32Cube_FW_F7_V1.7.0/Drivers/CMSIS/Device/ST/STM32F7xx/Include" -I"/mnt/Data_WD/google-drive/embeded-summer-school-borche/voltmeter/STM32Cube_FW_F7_V1.7.0/Drivers/STM32F7xx_HAL_Driver/Inc" -I"/mnt/Data_WD/google-drive/embeded-summer-school-borche/voltmeter/STM32Cube_FW_F7_V1.7.0/Drivers/BSP/STM32F723E-Discovery" -I"/mnt/Data_WD/google-drive/embeded-summer-school-borche/voltmeter/STM32Cube_FW_F7_V1.7.0/Drivers/BSP/Components/Common" -I"/mnt/Data_WD/google-drive/embeded-summer-school-borche/voltmeter/STM32Cube_FW_F7_V1.7.0/Utilities/Log" -I"/mnt/Data_WD/google-drive/embeded-summer-school-borche/voltmeter/STM32Cube_FW_F7_V1.7.0/Utilities/Fonts" -I"/mnt/Data_WD/google-drive/embeded-summer-school-borche/voltmeter/STM32Cube_FW_F7_V1.7.0/Utilities/CPU" -I"/mnt/Data_WD/google-drive/embeded-summer-school-borche/voltmeter/STM32Cube_FW_F7_V1.7.0/Drivers/CMSIS/Include"  -Os -g3 -Wall -fmessage-length=0 -Wno-strict-aliasing -ffunction-sections -c -fmessage-length=0 -MMD -MP -MF"$(@:%.o=%.d)" -MT"$@" -o "$@" "$<"
	@echo 'Finished building: $<'
	@echo ' '

Drivers/BSP/STM32F769I_DISCOVERY/stm32f723e_discovery_psram.o: /mnt/Data_WD/google-drive/embeded-summer-school-borche/voltmeter/STM32Cube_FW_F7_V1.7.0/Drivers/BSP/STM32F723E-Discovery/stm32f723e_discovery_psram.c
	@echo 'Building file: $<'
	@echo 'Invoking: MCU GCC Compiler'
	@echo $(PWD)
	arm-none-eabi-gcc -mcpu=cortex-m7 -mthumb -mfloat-abi=hard -mfpu=fpv5-sp-d16 -DUSE_HAL_DRIVER -DSTM32F723xx -I"/mnt/Data_WD/google-drive/embeded-summer-school-borche/voltmeter/STM32Cube_FW_F7_V1.7.0/Projects/STM32F723E-Discovery/Templates/Inc" -I"/mnt/Data_WD/google-drive/embeded-summer-school-borche/voltmeter/STM32Cube_FW_F7_V1.7.0/Drivers/CMSIS/Device/ST/STM32F7xx/Include" -I"/mnt/Data_WD/google-drive/embeded-summer-school-borche/voltmeter/STM32Cube_FW_F7_V1.7.0/Drivers/STM32F7xx_HAL_Driver/Inc" -I"/mnt/Data_WD/google-drive/embeded-summer-school-borche/voltmeter/STM32Cube_FW_F7_V1.7.0/Drivers/BSP/STM32F723E-Discovery" -I"/mnt/Data_WD/google-drive/embeded-summer-school-borche/voltmeter/STM32Cube_FW_F7_V1.7.0/Drivers/BSP/Components/Common" -I"/mnt/Data_WD/google-drive/embeded-summer-school-borche/voltmeter/STM32Cube_FW_F7_V1.7.0/Utilities/Log" -I"/mnt/Data_WD/google-drive/embeded-summer-school-borche/voltmeter/STM32Cube_FW_F7_V1.7.0/Utilities/Fonts" -I"/mnt/Data_WD/google-drive/embeded-summer-school-borche/voltmeter/STM32Cube_FW_F7_V1.7.0/Utilities/CPU" -I"/mnt/Data_WD/google-drive/embeded-summer-school-borche/voltmeter/STM32Cube_FW_F7_V1.7.0/Drivers/CMSIS/Include"  -Os -g3 -Wall -fmessage-length=0 -Wno-strict-aliasing -ffunction-sections -c -fmessage-length=0 -MMD -MP -MF"$(@:%.o=%.d)" -MT"$@" -o "$@" "$<"
	@echo 'Finished building: $<'
	@echo ' '

Drivers/BSP/STM32F769I_DISCOVERY/stm32f723e_discovery_qspi.o: /mnt/Data_WD/google-drive/embeded-summer-school-borche/voltmeter/STM32Cube_FW_F7_V1.7.0/Drivers/BSP/STM32F723E-Discovery/stm32f723e_discovery_qspi.c
	@echo 'Building file: $<'
	@echo 'Invoking: MCU GCC Compiler'
	@echo $(PWD)
	arm-none-eabi-gcc -mcpu=cortex-m7 -mthumb -mfloat-abi=hard -mfpu=fpv5-sp-d16 -DUSE_HAL_DRIVER -DSTM32F723xx -I"/mnt/Data_WD/google-drive/embeded-summer-school-borche/voltmeter/STM32Cube_FW_F7_V1.7.0/Projects/STM32F723E-Discovery/Templates/Inc" -I"/mnt/Data_WD/google-drive/embeded-summer-school-borche/voltmeter/STM32Cube_FW_F7_V1.7.0/Drivers/CMSIS/Device/ST/STM32F7xx/Include" -I"/mnt/Data_WD/google-drive/embeded-summer-school-borche/voltmeter/STM32Cube_FW_F7_V1.7.0/Drivers/STM32F7xx_HAL_Driver/Inc" -I"/mnt/Data_WD/google-drive/embeded-summer-school-borche/voltmeter/STM32Cube_FW_F7_V1.7.0/Drivers/BSP/STM32F723E-Discovery" -I"/mnt/Data_WD/google-drive/embeded-summer-school-borche/voltmeter/STM32Cube_FW_F7_V1.7.0/Drivers/BSP/Components/Common" -I"/mnt/Data_WD/google-drive/embeded-summer-school-borche/voltmeter/STM32Cube_FW_F7_V1.7.0/Utilities/Log" -I"/mnt/Data_WD/google-drive/embeded-summer-school-borche/voltmeter/STM32Cube_FW_F7_V1.7.0/Utilities/Fonts" -I"/mnt/Data_WD/google-drive/embeded-summer-school-borche/voltmeter/STM32Cube_FW_F7_V1.7.0/Utilities/CPU" -I"/mnt/Data_WD/google-drive/embeded-summer-school-borche/voltmeter/STM32Cube_FW_F7_V1.7.0/Drivers/CMSIS/Include"  -Os -g3 -Wall -fmessage-length=0 -Wno-strict-aliasing -ffunction-sections -c -fmessage-length=0 -MMD -MP -MF"$(@:%.o=%.d)" -MT"$@" -o "$@" "$<"
	@echo 'Finished building: $<'
	@echo ' '

Drivers/BSP/STM32F769I_DISCOVERY/stm32f723e_discovery_ts.o: /mnt/Data_WD/google-drive/embeded-summer-school-borche/voltmeter/STM32Cube_FW_F7_V1.7.0/Drivers/BSP/STM32F723E-Discovery/stm32f723e_discovery_ts.c
	@echo 'Building file: $<'
	@echo 'Invoking: MCU GCC Compiler'
	@echo $(PWD)
	arm-none-eabi-gcc -mcpu=cortex-m7 -mthumb -mfloat-abi=hard -mfpu=fpv5-sp-d16 -DUSE_HAL_DRIVER -DSTM32F723xx -I"/mnt/Data_WD/google-drive/embeded-summer-school-borche/voltmeter/STM32Cube_FW_F7_V1.7.0/Projects/STM32F723E-Discovery/Templates/Inc" -I"/mnt/Data_WD/google-drive/embeded-summer-school-borche/voltmeter/STM32Cube_FW_F7_V1.7.0/Drivers/CMSIS/Device/ST/STM32F7xx/Include" -I"/mnt/Data_WD/google-drive/embeded-summer-school-borche/voltmeter/STM32Cube_FW_F7_V1.7.0/Drivers/STM32F7xx_HAL_Driver/Inc" -I"/mnt/Data_WD/google-drive/embeded-summer-school-borche/voltmeter/STM32Cube_FW_F7_V1.7.0/Drivers/BSP/STM32F723E-Discovery" -I"/mnt/Data_WD/google-drive/embeded-summer-school-borche/voltmeter/STM32Cube_FW_F7_V1.7.0/Drivers/BSP/Components/Common" -I"/mnt/Data_WD/google-drive/embeded-summer-school-borche/voltmeter/STM32Cube_FW_F7_V1.7.0/Utilities/Log" -I"/mnt/Data_WD/google-drive/embeded-summer-school-borche/voltmeter/STM32Cube_FW_F7_V1.7.0/Utilities/Fonts" -I"/mnt/Data_WD/google-drive/embeded-summer-school-borche/voltmeter/STM32Cube_FW_F7_V1.7.0/Utilities/CPU" -I"/mnt/Data_WD/google-drive/embeded-summer-school-borche/voltmeter/STM32Cube_FW_F7_V1.7.0/Drivers/CMSIS/Include"  -Os -g3 -Wall -fmessage-length=0 -Wno-strict-aliasing -ffunction-sections -c -fmessage-length=0 -MMD -MP -MF"$(@:%.o=%.d)" -MT"$@" -o "$@" "$<"
	@echo 'Finished building: $<'
	@echo ' '


