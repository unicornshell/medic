/*
 * @Author: lebhoryi@gmail.com
 * @Date: 2021-06-30 16:52:58
 * @LastEditors: lebhoryi@gmail.com
 * @LastEditTime: 2021-07-01 19:36:20
 * @Version: V0.0.1
 * @FilePath: /art_pi/applications/fire_detection.c
 * @Description: fire detection demo app
 */
#include <rtthread.h>
#include "drv_common.h"
#include <rtdevice.h>
#include "drv_spi_ili9488.h"  // spi lcd driver
#include <lcd_spi_port.h>  // lcd ports

/* fire detection */
#include <rt_ai_expression_model.h>
#include <rt_ai.h>
#include <rt_ai_log.h>
#include <backend_cubeai.h>
#include <logo.h>

#define LED_PIN GET_PIN(I, 8)

struct rt_event ov2640_event;
#if 1
rt_ai_buffer_t ai_flag = 0;
int ai_run_complete_flag = 1;

void ai_run_complete(void *arg){
    *(int*)arg = 1;
}
extern void DCMI_Start(void);
void ai_camera();
void bilinera_interpolation(rt_uint8_t *in_array, short height, short width,
                            rt_uint8_t *out_array, short out_height, short out_width);

int expression_app(void)
{
    /* init spi data notify event */
    rt_event_init(&ov2640_event, "ov2640", RT_IPC_FLAG_FIFO);

    struct drv_lcd_device *lcd;
    struct rt_device_rect_info rect_info = { 0, 0, LCD_WIDTH, 240 };
    lcd = (struct drv_lcd_device *) rt_device_find("lcd");

    lcd_show_image(0, 0, 320, 240, LOGO);
    lcd_show_string(90, 140, 16, "Hello RT-Thread!");
    lcd_show_string(90, 156, 16, "Demo: expression_app");
    rt_thread_mdelay(1000);

//    rt_err_t result = RT_EOK;
//    int ai_run_complete_flag = 0;

    /* find a registered model handle */
    static rt_ai_t model = NULL;
    model = rt_ai_find(RT_AI_EXPRESSION_MODEL_NAME);
    if (!model)
    {
        rt_kprintf("ai model find err\r\n");
        return -1;
    }

    // allocate input memory
    rt_ai_buffer_t *input_image = rt_malloc(RT_AI_EXPRESSION_IN_1_SIZE_BYTES);
    if (!input_image)
    {
        rt_kprintf("malloc err\n");
        return -1;
    }

    // allocate calculate memory
    rt_ai_buffer_t *work_buf = rt_malloc(RT_AI_EXPRESSION_WORK_BUFFER_BYTES);
    if (!work_buf)
    {
        rt_kprintf("malloc err\n");
        return -1;
    }

    // allocate output memory
    rt_ai_buffer_t *_out = rt_malloc(RT_AI_EXPRESSION_OUT_1_SIZE_BYTES);
    if (!_out)
    {
        rt_kprintf("malloc err\n");
        return -1;
    }

    // ai model init
    rt_ai_buffer_t model_init = rt_ai_init(model, work_buf);
    if (model_init != 0)
    {
        rt_kprintf("ai init err\n");
        return -1;
    }
    rt_ai_config(model, CFG_INPUT_0_ADDR, input_image);
    rt_ai_config(model, CFG_OUTPUT_0_ADDR, _out);

    ai_camera();

    while (1)
    {
        rt_pin_write(LED_PIN, PIN_LOW);
        rt_event_recv(&ov2640_event, 1,
        RT_EVENT_FLAG_AND | RT_EVENT_FLAG_CLEAR,
        RT_WAITING_FOREVER,
        RT_NULL);
        rt_pin_write(LED_PIN, PIN_HIGH);
        lcd->parent.control(&lcd->parent, RTGRAPHIC_CTRL_RECT_UPDATE, &rect_info);
        if (ai_flag > 0)
        {
            // resize
            bilinera_interpolation(lcd->lcd_info.framebuffer, 240, 320, input_image, 48, 48);
            rt_ai_run(model, NULL, NULL);
            uint8_t *out = (uint8_t *) rt_ai_output(model, 0);
            rt_kprintf("pred: %d %d %d %d %d %d %d\n", out[0], out[1], out[2], out[3], out[4], out[5], out[6]);


             // get output and post-process the output
            if(ai_run_complete_flag){
                //get inferance data
                float *out = (float *)rt_ai_output(model, 0);
                int prediction =0;
                for(int i = 1 ; i < 7 ; i++)
                {
                    if(out[i] > out[prediction])
                    {
                        prediction = i;
                    }

                }
                switch (prediction)
                                  {
                                      case 0:lcd_show_string(20, 20, 16, "anger");rt_kprintf("anger");break;
                                      case 1:lcd_show_string(20, 20, 16, "disgust");rt_kprintf("disgust");break;
                                      case 2:lcd_show_string(20, 20, 16, "fear");rt_kprintf("fear");break;
                                      case 3:lcd_show_string(20, 20, 16, "happy");rt_kprintf("happy");break;
                                      case 4:lcd_show_string(20, 20, 16, "normal");rt_kprintf("normal");break;
                                      case 5:lcd_show_string(20, 20, 16, "sad");rt_kprintf("sad");break;
                                      default:lcd_show_string(20, 20, 16, "surprised");rt_kprintf("surprised");break;
                                  }
            }
/*
              if (out[0] > 200)
                {
                    lcd_show_string(20, 20, 16, "anger");
                    rt_kprintf("Expression is anger");
                }

                else if (out[1] > 200)
                {
                    lcd_show_string(20, 20, 16, "disgust");
                    rt_kprintf("Expression is disgust");
                }

                else if (out[2] > 200)
                {
                    lcd_show_string(20, 20, 16, "fear");
                    rt_kprintf("Expression is fear");
                }
                else if (out[3] > 200)
                {
                    lcd_show_string(20, 20, 16, "happy");
                    rt_kprintf("Expression is happy");
                }
                else if (out[4] > 200)
                {
                    lcd_show_string(20, 20, 16, "normal");
                    rt_kprintf("Expression is normal");
                }

                else if (out[5] > 200)
                {
                    lcd_show_string(20, 20, 16, "sad");
                    rt_kprintf("Expression is sad");
                }

                else
                {
                    lcd_show_string(20, 20, 16, "surprised");
                    rt_kprintf("Expression is surprised");
                }
                */
            DCMI_Start();
        }
    }
    rt_free(input_image);
    rt_free(work_buf);
    rt_free(_out);
    return 0;
}
MSH_CMD_EXPORT(expression_app,expression demo);
//INIT_COMPONENT_EXPORT(expression_app);


void ai_camera()
{
    extern int rt_gc0328c_init(void);
    rt_gc0328c_init();
    ai_flag = 1;
    DCMI_Start();
}


int is_in_array(short x, short y, short height, short width)
{
    if (x >= 0 && x < width && y >= 0 && y < height)
        return 1;
    else
        return 0;
}


void bilinera_interpolation(rt_uint8_t* in_array, short height, short width,
                            rt_uint8_t* out_array, short out_height, short out_width)
{
    double h_times = (double)out_height / (double)height,
           w_times = (double)out_width / (double)width;
    short  x1, y1, x2, y2, f11, f12, f21, f22;
    double x, y;

    for (int i = 0; i < out_height; i++){
        for (int j = 0; j < out_width*3; j=j+3){
            for (int k =0; k <3; k++){
                x = j / w_times + k;
                y = i / h_times;

                x1 = (short)(x - 3);
                x2 = (short)(x + 3);
                y1 = (short)(y + 1);
                y2 = (short)(y - 1);
                f11 = is_in_array(x1, y1, height, width*3) ? in_array[y1*width*3+x1] : 0;
                f12 = is_in_array(x1, y2, height, width*3) ? in_array[y2*width*3+x1] : 0;
                f21 = is_in_array(x2, y1, height, width*3) ? in_array[y1*width*3+x2] : 0;
                f22 = is_in_array(x2, y2, height, width*3) ? in_array[y2*width*3+x2] : 0;
                out_array[i*out_width*3+j+k] = (rt_uint8_t)(((f11 * (x2 - x) * (y2 - y)) +
                                           (f21 * (x - x1) * (y2 - y)) +
                                           (f12 * (x2 - x) * (y - y1)) +
                                           (f22 * (x - x1) * (y - y1))) / ((x2 - x1) * (y2 - y1)));
            }
        }
    }
}

#endif
