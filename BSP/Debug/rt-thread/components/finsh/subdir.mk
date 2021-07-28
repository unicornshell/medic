################################################################################
# 自动生成的文件。不要编辑！
################################################################################

# Add inputs and outputs from these tool invocations to the build variables 
C_SRCS += \
../rt-thread/components/finsh/cmd.c \
../rt-thread/components/finsh/finsh_compiler.c \
../rt-thread/components/finsh/finsh_error.c \
../rt-thread/components/finsh/finsh_heap.c \
../rt-thread/components/finsh/finsh_init.c \
../rt-thread/components/finsh/finsh_node.c \
../rt-thread/components/finsh/finsh_ops.c \
../rt-thread/components/finsh/finsh_parser.c \
../rt-thread/components/finsh/finsh_token.c \
../rt-thread/components/finsh/finsh_var.c \
../rt-thread/components/finsh/finsh_vm.c \
../rt-thread/components/finsh/msh.c \
../rt-thread/components/finsh/msh_file.c \
../rt-thread/components/finsh/shell.c 

OBJS += \
./rt-thread/components/finsh/cmd.o \
./rt-thread/components/finsh/finsh_compiler.o \
./rt-thread/components/finsh/finsh_error.o \
./rt-thread/components/finsh/finsh_heap.o \
./rt-thread/components/finsh/finsh_init.o \
./rt-thread/components/finsh/finsh_node.o \
./rt-thread/components/finsh/finsh_ops.o \
./rt-thread/components/finsh/finsh_parser.o \
./rt-thread/components/finsh/finsh_token.o \
./rt-thread/components/finsh/finsh_var.o \
./rt-thread/components/finsh/finsh_vm.o \
./rt-thread/components/finsh/msh.o \
./rt-thread/components/finsh/msh_file.o \
./rt-thread/components/finsh/shell.o 

C_DEPS += \
./rt-thread/components/finsh/cmd.d \
./rt-thread/components/finsh/finsh_compiler.d \
./rt-thread/components/finsh/finsh_error.d \
./rt-thread/components/finsh/finsh_heap.d \
./rt-thread/components/finsh/finsh_init.d \
./rt-thread/components/finsh/finsh_node.d \
./rt-thread/components/finsh/finsh_ops.d \
./rt-thread/components/finsh/finsh_parser.d \
./rt-thread/components/finsh/finsh_token.d \
./rt-thread/components/finsh/finsh_var.d \
./rt-thread/components/finsh/finsh_vm.d \
./rt-thread/components/finsh/msh.d \
./rt-thread/components/finsh/msh_file.d \
./rt-thread/components/finsh/shell.d 


# Each subdirectory must supply rules for building sources it contributes
rt-thread/components/finsh/%.o: ../rt-thread/components/finsh/%.c
	arm-none-eabi-gcc -mcpu=cortex-m7 -mthumb -mfloat-abi=hard -mfpu=fpv4-sp-d16 -O0 -ffunction-sections -fdata-sections -Wall  -g -gdwarf-2 -DDEBUG -I"E:\expression_reco" -I"E:\expression_reco\Middlewares\ST\AI\Inc" -I"E:\expression_reco\X-CUBE-AI\App" -I"E:\expression_reco\X-CUBE-AI" -I"E:\expression_reco\applications" -I"E:\expression_reco\board\CubeMX_Config\Core\Inc" -I"E:\expression_reco\board\port" -I"E:\expression_reco\board" -I"E:\expression_reco\libraries\STM32H7xx_HAL\CMSIS\Device\ST\STM32H7xx\Include" -I"E:\expression_reco\libraries\STM32H7xx_HAL\CMSIS\Include" -I"E:\expression_reco\libraries\STM32H7xx_HAL\STM32H7xx_HAL_Driver\Inc" -I"E:\expression_reco\libraries\drivers\include\config" -I"E:\expression_reco\libraries\drivers\include" -I"E:\expression_reco\libraries\drivers" -I"E:\expression_reco\rt-thread\components\dfs\filesystems\devfs" -I"E:\expression_reco\rt-thread\components\dfs\filesystems\elmfat" -I"E:\expression_reco\rt-thread\components\dfs\filesystems\romfs" -I"E:\expression_reco\rt-thread\components\dfs\include" -I"E:\expression_reco\rt-thread\components\drivers\include" -I"E:\expression_reco\rt-thread\components\drivers\spi" -I"E:\expression_reco\rt-thread\components\finsh" -I"E:\expression_reco\rt-thread\components\libc\compilers\newlib" -I"E:\expression_reco\rt-thread\include" -I"E:\expression_reco\rt-thread\libcpu\arm\common" -I"E:\expression_reco\rt-thread\libcpu\arm\cortex-m7" -I"E:\expression_reco\rt_ai_lib\backend_plugin_stm32" -I"E:\expression_reco\rt_ai_lib\img" -I"E:\expression_reco\rt_ai_lib\include" -I"E:\expression_reco\rt_ai_lib" -include"E:\expression_reco\rtconfig_preinc.h" -std=gnu11 -MMD -MP -MF"$(@:%.o=%.d)" -MT"$(@)" -c -o "$@" "$<"

