/**********************************************************************/
/*   ____  ____                                                       */
/*  /   /\/   /                                                       */
/* /___/  \  /                                                        */
/* \   \   \/                                                       */
/*  \   \        Copyright (c) 2003-2009 Xilinx, Inc.                */
/*  /   /          All Right Reserved.                                 */
/* /---/   /\                                                         */
/* \   \  /  \                                                      */
/*  \___\/\___\                                                    */
/***********************************************************************/

/* This file is designed for use with ISim build 0x7708f090 */

#define XSI_HIDE_SYMBOL_SPEC true
#include "xsi.h"
#include <memory.h>
#ifdef __GNUC__
#include <stdlib.h>
#else
#include <malloc.h>
#define alloca _alloca
#endif
static const char *ng0 = "C:/Users/Hau Tran/Desktop/alu/ALU/test.vhd";
extern char *IEEE_P_3620187407;

char *ieee_p_3620187407_sub_767668596_3965413181(char *, char *, char *, char *, char *, char *);


static void work_a_2521077532_2372691052_p_0(char *t0)
{
    char t12[16];
    char t13[16];
    char *t1;
    char *t2;
    char *t3;
    char *t4;
    char *t5;
    char *t6;
    char *t7;
    char *t8;
    int t9;
    int t10;
    int64 t11;
    int t14;
    unsigned int t15;
    unsigned int t16;
    unsigned char t17;
    char *t18;
    char *t19;
    char *t20;
    char *t21;
    char *t22;

LAB0:    t1 = (t0 + 2992U);
    t2 = *((char **)t1);
    if (t2 == 0)
        goto LAB2;

LAB3:    goto *t2;

LAB2:    xsi_set_current_line(52, ng0);
    t2 = (t0 + 5492);
    t4 = (t0 + 3376);
    t5 = (t4 + 56U);
    t6 = *((char **)t5);
    t7 = (t6 + 56U);
    t8 = *((char **)t7);
    memcpy(t8, t2, 8U);
    xsi_driver_first_trans_fast(t4);
    xsi_set_current_line(53, ng0);
    t2 = (t0 + 5500);
    t4 = (t0 + 3440);
    t5 = (t4 + 56U);
    t6 = *((char **)t5);
    t7 = (t6 + 56U);
    t8 = *((char **)t7);
    memcpy(t8, t2, 8U);
    xsi_driver_first_trans_fast(t4);
    xsi_set_current_line(54, ng0);
    t2 = (t0 + 5508);
    t4 = (t0 + 3504);
    t5 = (t4 + 56U);
    t6 = *((char **)t5);
    t7 = (t6 + 56U);
    t8 = *((char **)t7);
    memcpy(t8, t2, 4U);
    xsi_driver_first_trans_fast(t4);
    xsi_set_current_line(56, ng0);
    t2 = (t0 + 5512);
    *((int *)t2) = 0;
    t3 = (t0 + 5516);
    *((int *)t3) = 15;
    t9 = 0;
    t10 = 15;

LAB4:    if (t9 <= t10)
        goto LAB5;

LAB7:    xsi_set_current_line(61, ng0);
    t2 = (t0 + 5524);
    t4 = (t0 + 3376);
    t5 = (t4 + 56U);
    t6 = *((char **)t5);
    t7 = (t6 + 56U);
    t8 = *((char **)t7);
    memcpy(t8, t2, 8U);
    xsi_driver_first_trans_fast(t4);
    xsi_set_current_line(62, ng0);
    t2 = (t0 + 5532);
    t4 = (t0 + 3440);
    t5 = (t4 + 56U);
    t6 = *((char **)t5);
    t7 = (t6 + 56U);
    t8 = *((char **)t7);
    memcpy(t8, t2, 8U);
    xsi_driver_first_trans_fast(t4);
    xsi_set_current_line(63, ng0);

LAB17:    *((char **)t1) = &&LAB18;

LAB1:    return;
LAB5:    xsi_set_current_line(57, ng0);
    t11 = (100 * 1000LL);
    t4 = (t0 + 2800);
    xsi_process_wait(t4, t11);

LAB10:    *((char **)t1) = &&LAB11;
    goto LAB1;

LAB6:    t2 = (t0 + 5512);
    t9 = *((int *)t2);
    t3 = (t0 + 5516);
    t10 = *((int *)t3);
    if (t9 == t10)
        goto LAB7;

LAB14:    t14 = (t9 + 1);
    t9 = t14;
    t4 = (t0 + 5512);
    *((int *)t4) = t9;
    goto LAB4;

LAB8:    xsi_set_current_line(58, ng0);
    t2 = (t0 + 1352U);
    t3 = *((char **)t2);
    t2 = (t0 + 5416U);
    t4 = (t0 + 5520);
    t6 = (t13 + 0U);
    t7 = (t6 + 0U);
    *((int *)t7) = 0;
    t7 = (t6 + 4U);
    *((int *)t7) = 3;
    t7 = (t6 + 8U);
    *((int *)t7) = 1;
    t14 = (3 - 0);
    t15 = (t14 * 1);
    t15 = (t15 + 1);
    t7 = (t6 + 12U);
    *((unsigned int *)t7) = t15;
    t7 = ieee_p_3620187407_sub_767668596_3965413181(IEEE_P_3620187407, t12, t3, t2, t4, t13);
    t8 = (t12 + 12U);
    t15 = *((unsigned int *)t8);
    t16 = (1U * t15);
    t17 = (4U != t16);
    if (t17 == 1)
        goto LAB12;

LAB13:    t18 = (t0 + 3504);
    t19 = (t18 + 56U);
    t20 = *((char **)t19);
    t21 = (t20 + 56U);
    t22 = *((char **)t21);
    memcpy(t22, t7, 4U);
    xsi_driver_first_trans_fast(t18);
    goto LAB6;

LAB9:    goto LAB8;

LAB11:    goto LAB9;

LAB12:    xsi_size_not_matching(4U, t16, 0);
    goto LAB13;

LAB15:    goto LAB2;

LAB16:    goto LAB15;

LAB18:    goto LAB16;

}


extern void work_a_2521077532_2372691052_init()
{
	static char *pe[] = {(void *)work_a_2521077532_2372691052_p_0};
	xsi_register_didat("work_a_2521077532_2372691052", "isim/tb_ALU_isim_beh.exe.sim/work/a_2521077532_2372691052.didat");
	xsi_register_executes(pe);
}
