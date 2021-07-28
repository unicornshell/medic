################################################################################
# 自动生成的文件。不要编辑！
################################################################################

# Add inputs and outputs from these tool invocations to the build variables 
C_SRCS += \
../rt-thread/libcpu/arm/cortex-m7/cpu_cache.c \
../rt-thread/libcpu/arm/cortex-m7/cpuport.c 

S_UPPER_SRCS += \
../rt-thread/libcpu/arm/cortex-m7/context_gcc.S 

OBJS += \
./rt-thread/libcpu/arm/cortex-m7/context_gcc.o \
./rt-thread/libcpu/arm/cortex-m7/cpu_cache.o \
./rt-thread/libcpu/arm/cortex-m7/cpuport.o 

S_UPPER_DEPS += \
./rt-thread/libcpu/arm/cortex-m7/context_gcc.d 

C_DEPS += \
./rt-thread/libcpu/arm/cortex-m7/cpu_cache.d \
./rt-thread/libcpu/arm/cortex-m7/cpuport.d 


# Each subdirectory must supply rules for building sources it contributes
rt-thread/libcpu/arm/cortex-m7/%.o: ../rt-thread/libcpu/arm/cortex-m7/%.S
	arm-none-eabi-gcc -mcpu=cortex-m7 -mthumb -mfloat-abi=hard -mfpu=fpv4-sp-d16 -O0 -ffunction-sections -fdata-sections -Wall  -g -gdwarf-2 -x assembler-with-cpp -I"E:\expression_reco" -Xassembler -mimplicit-it=thumb -MMD -MP -MF"$(@:%.o=%.d)" -MT"$(@)" -c -o "$@" "$<"
rt-thread/libcpu/arm/cortex-m7/%.o: ../rt-thread/libcpu/arm/cortex-m7/%.c
	arm-none-eabi-gcc -mcpu=cortex-m7 -mthumb -mfloat-abi=hard -mfpu=fpv4-sp-d16 -O0 -ffunction-sections -fdata-sections -Wall  -g -gdwarf-2 -DDEBUG -I"E:\expression_reco" -I"E:\expression_reco\Middlewares\ST\AI\Inc" -I"E:\expression_reco\X-CUBE-AI\App" -I"E:\expression_reco\X-CUBE-AI" -I"E:\expression_reco\applications" -I"E:\expression_reco\board\CubeMX_Config\Core\Inc" -I"E:\expression_reco\board\port" -I"E:\expression_reco\board" -I"E:\expression_reco\libraries\STM32H7xx_HAL\CMSIS\Device\ST\STM32H7xx\Include" -I"E:\expression_reco\libraries\STM32H7xx_HAL\CMSIS\Include" -I"E:\expression_reco\libraries\STM32H7xx_HAL\STM32H7xx_HAL_Driver\Inc" -I"E:\expression_reco\libraries\drivers\include\config" -I"E:\expression_reco\libraries\drivers\include" -I"E:\expression_reco\libraries\drivers" -I"E:\expression_reco\rt-thread\components\dfs\filesystems\devfs" -I"E:\expression_reco\rt-thread\components\dfs\filesystems\elmfat" -I"E:\expression_reco\rt-thread\components\dfs\filesystems\romfs" -I"E:\expression_reco\rt-thread\components\dfs\include" -I"E:\expression_reco\rt-thread\components\drivers\include" -I"E:\expression_reco\rt-thread\components\drivers\spi" -I"E:\expression_reco\rt-thread\components\finsh" -I"E:\expression_reco\rt-thread\components\libc\compilers\newlib" -I"E:\expression_reco\rt-thread\include" -I"E:\expression_reco\rt-thread\libcpu\arm\common" -I"E:\expression_reco\rt-thread\libcpu\arm\cortex-m7" -I"E:\expression_reco\rt_ai_lib\backend_plugin_stm32" -I"E:\expression_reco\rt_ai_lib\img" -I"E:\expression_reco\rt_ai_lib\include" -I"E:\expression_reco\rt_ai_lib" -include"E:\expression_reco\rtconfig_preinc.h" -std=gnu11 -MMD -MP -MF"$(@:%.o=%.d)" -MT"$(@)" -c -o "$@" "$<"

