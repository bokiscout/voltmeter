################################################################################
# Automatically-generated file. Do not edit!
################################################################################

# Add inputs and outputs from these tool invocations to the build variables 
C_SRCS += \
/mnt/Data_WD/google-drive/embeded-summer-school-borche/voltmeter/STM32Cube_FW_F7_V1.7.0/Drivers/BSP/Components/ft6x06/ft6x06.c \
/mnt/Data_WD/google-drive/embeded-summer-school-borche/voltmeter/STM32Cube_FW_F7_V1.7.0/Drivers/BSP/Components/st7789h2/st7789h2.c \
/mnt/Data_WD/google-drive/embeded-summer-school-borche/voltmeter/STM32Cube_FW_F7_V1.7.0/Drivers/BSP/Components/wm8994/wm8994.c 

OBJS += \
./Drivers/BSP/Components/ft6x06.o \
./Drivers/BSP/Components/st7789h2.o \
./Drivers/BSP/Components/wm8994.o 

C_DEPS += \
./Drivers/BSP/Components/ft6x06.d \
./Drivers/BSP/Components/st7789h2.d \
./Drivers/BSP/Components/wm8994.d 


# Each subdirectory must supply rules for building sources it contributes
Drivers/BSP/Components/ft6x06.o: /mnt/Data_WD/google-drive/embeded-summer-school-borche/voltmeter/STM32Cube_FW_F7_V1.7.0/Drivers/BSP/Components/ft6x06/ft6x06.c
	@echo 'Building file: $<'
	@echo 'Invoking: MCU GCC Compiler'
	@echo $(PWD)
	arm-none-eabi-gcc -mcpu=cortex-m7 -mthumb -mfloat-abi=hard -mfpu=fpv5-sp-d16 -DUSE_HAL_DRIVER -DSTM32F723xx -I"/mnt/Data_WD/google-drive/embeded-summer-school-borche/voltmeter/STM32Cube_FW_F7_V1.7.0/Projects/STM32F723E-Discovery/Templates/Inc" -I"/mnt/Data_WD/google-drive/embeded-summer-school-borche/voltmeter/STM32Cube_FW_F7_V1.7.0/Drivers/CMSIS/Device/ST/STM32F7xx/Include" -I"/mnt/Data_WD/google-drive/embeded-summer-school-borche/voltmeter/STM32Cube_FW_F7_V1.7.0/Drivers/STM32F7xx_HAL_Driver/Inc" -I"/mnt/Data_WD/google-drive/embeded-summer-school-borche/voltmeter/STM32Cube_FW_F7_V1.7.0/Drivers/BSP/STM32F723E-Discovery" -I"/mnt/Data_WD/google-drive/embeded-summer-school-borche/voltmeter/STM32Cube_FW_F7_V1.7.0/Drivers/BSP/Components/Common" -I"/mnt/Data_WD/google-drive/embeded-summer-school-borche/voltmeter/STM32Cube_FW_F7_V1.7.0/Utilities/Log" -I"/mnt/Data_WD/google-drive/embeded-summer-school-borche/voltmeter/STM32Cube_FW_F7_V1.7.0/Utilities/Fonts" -I"/mnt/Data_WD/google-drive/embeded-summer-school-borche/voltmeter/STM32Cube_FW_F7_V1.7.0/Utilities/CPU" -I"/mnt/Data_WD/google-drive/embeded-summer-school-borche/voltmeter/STM32Cube_FW_F7_V1.7.0/Drivers/CMSIS/Include"  -Os -g3 -Wall -fmessage-length=0 -Wno-strict-aliasing -ffunction-sections -c -fmessage-length=0 -MMD -MP -MF"$(@:%.o=%.d)" -MT"$@" -o "$@" "$<"
	@echo 'Finished building: $<'
	@echo ' '

Drivers/BSP/Components/st7789h2.o: /mnt/Data_WD/google-drive/embeded-summer-school-borche/voltmeter/STM32Cube_FW_F7_V1.7.0/Drivers/BSP/Components/st7789h2/st7789h2.c
	@echo 'Building file: $<'
	@echo 'Invoking: MCU GCC Compiler'
	@echo $(PWD)
	arm-none-eabi-gcc -mcpu=cortex-m7 -mthumb -mfloat-abi=hard -mfpu=fpv5-sp-d16 -DUSE_HAL_DRIVER -DSTM32F723xx -I"/mnt/Data_WD/google-drive/embeded-summer-school-borche/voltmeter/STM32Cube_FW_F7_V1.7.0/Projects/STM32F723E-Discovery/Templates/Inc" -I"/mnt/Data_WD/google-drive/embeded-summer-school-borche/voltmeter/STM32Cube_FW_F7_V1.7.0/Drivers/CMSIS/Device/ST/STM32F7xx/Include" -I"/mnt/Data_WD/google-drive/embeded-summer-school-borche/voltmeter/STM32Cube_FW_F7_V1.7.0/Drivers/STM32F7xx_HAL_Driver/Inc" -I"/mnt/Data_WD/google-drive/embeded-summer-school-borche/voltmeter/STM32Cube_FW_F7_V1.7.0/Drivers/BSP/STM32F723E-Discovery" -I"/mnt/Data_WD/google-drive/embeded-summer-school-borche/voltmeter/STM32Cube_FW_F7_V1.7.0/Drivers/BSP/Components/Common" -I"/mnt/Data_WD/google-drive/embeded-summer-school-borche/voltmeter/STM32Cube_FW_F7_V1.7.0/Utilities/Log" -I"/mnt/Data_WD/google-drive/embeded-summer-school-borche/voltmeter/STM32Cube_FW_F7_V1.7.0/Utilities/Fonts" -I"/mnt/Data_WD/google-drive/embeded-summer-school-borche/voltmeter/STM32Cube_FW_F7_V1.7.0/Utilities/CPU" -I"/mnt/Data_WD/google-drive/embeded-summer-school-borche/voltmeter/STM32Cube_FW_F7_V1.7.0/Drivers/CMSIS/Include"  -Os -g3 -Wall -fmessage-length=0 -Wno-strict-aliasing -ffunction-sections -c -fmessage-length=0 -MMD -MP -MF"$(@:%.o=%.d)" -MT"$@" -o "$@" "$<"
	@echo 'Finished building: $<'
	@echo ' '

Drivers/BSP/Components/wm8994.o: /mnt/Data_WD/google-drive/embeded-summer-school-borche/voltmeter/STM32Cube_FW_F7_V1.7.0/Drivers/BSP/Components/wm8994/wm8994.c
	@echo 'Building file: $<'
	@echo 'Invoking: MCU GCC Compiler'
	@echo $(PWD)
	arm-none-eabi-gcc -mcpu=cortex-m7 -mthumb -mfloat-abi=hard -mfpu=fpv5-sp-d16 -DUSE_HAL_DRIVER -DSTM32F723xx -I"/mnt/Data_WD/google-drive/embeded-summer-school-borche/voltmeter/STM32Cube_FW_F7_V1.7.0/Projects/STM32F723E-Discovery/Templates/Inc" -I"/mnt/Data_WD/google-drive/embeded-summer-school-borche/voltmeter/STM32Cube_FW_F7_V1.7.0/Drivers/CMSIS/Device/ST/STM32F7xx/Include" -I"/mnt/Data_WD/google-drive/embeded-summer-school-borche/voltmeter/STM32Cube_FW_F7_V1.7.0/Drivers/STM32F7xx_HAL_Driver/Inc" -I"/mnt/Data_WD/google-drive/embeded-summer-school-borche/voltmeter/STM32Cube_FW_F7_V1.7.0/Drivers/BSP/STM32F723E-Discovery" -I"/mnt/Data_WD/google-drive/embeded-summer-school-borche/voltmeter/STM32Cube_FW_F7_V1.7.0/Drivers/BSP/Components/Common" -I"/mnt/Data_WD/google-drive/embeded-summer-school-borche/voltmeter/STM32Cube_FW_F7_V1.7.0/Utilities/Log" -I"/mnt/Data_WD/google-drive/embeded-summer-school-borche/voltmeter/STM32Cube_FW_F7_V1.7.0/Utilities/Fonts" -I"/mnt/Data_WD/google-drive/embeded-summer-school-borche/voltmeter/STM32Cube_FW_F7_V1.7.0/Utilities/CPU" -I"/mnt/Data_WD/google-drive/embeded-summer-school-borche/voltmeter/STM32Cube_FW_F7_V1.7.0/Drivers/CMSIS/Include"  -Os -g3 -Wall -fmessage-length=0 -Wno-strict-aliasing -ffunction-sections -c -fmessage-length=0 -MMD -MP -MF"$(@:%.o=%.d)" -MT"$@" -o "$@" "$<"
	@echo 'Finished building: $<'
	@echo ' '


