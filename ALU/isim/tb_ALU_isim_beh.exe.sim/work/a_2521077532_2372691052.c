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
static const char *ng0 = "C:/Users/Hau Tran/Desktop/vhdl/ALU/test_ALU.vhd";
extern char *IEEE_P_3620187407;

char *ieee_p_3620187407_sub_767668596_3965413181(char *, char *, char *, char *, char *, char *);


static void work_a_2521077532_2372691052_p_0(char *t0)
{
    char t11[16];
    char t12[16];
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
    char *t13;
    int t14;
    unsigned int t15;
    char *t16;
    unsigned int t17;
    unsigned char t18;
    char *t19;
    char *t20;
    char *t21;
    char *t22;
    char *t23;
    int64 t24;

LAB0:    t1 = (t0 + 2992U);
    t2 = *((char **)t1);
    if (t2 == 0)
        goto LAB2;

LAB3:    goto *t2;

LAB2:    xsi_set_current_line(52, ng0);
    t2 = (t0 + 5544);
    t4 = (t0 + 3376);
    t5 = (t4 + 56U);
    t6 = *((char **)t5);
    t7 = (t6 + 56U);
    t8 = *((char **)t7);
    memcpy(t8, t2, 8U);
    xsi_driver_first_trans_fast(t4);
    xsi_set_current_line(53, ng0);
    t2 = (t0 + 5552);
    t4 = (t0 + 3440);
    t5 = (t4 + 56U);
    t6 = *((char **)t5);
    t7 = (t6 + 56U);
    t8 = *((char **)t7);
    memcpy(t8, t2, 8U);
    xsi_driver_first_trans_fast(t4);
    xsi_set_current_line(54, ng0);
    t2 = (t0 + 5560);
    t4 = (t0 + 3504);
    t5 = (t4 + 56U);
    t6 = *((char **)t5);
    t7 = (t6 + 56U);
    t8 = *((char **)t7);
    memcpy(t8, t2, 4U);
    xsi_driver_first_trans_fast(t4);
    xsi_set_current_line(56, ng0);
    t2 = (t0 + 5564);
    *((int *)t2) = 0;
    t3 = (t0 + 5568);
    *((int *)t3) = 15;
    t9 = 0;
    t10 = 15;

LAB4:    if (t9 <= t10)
        goto LAB5;

LAB7:    xsi_set_current_line(60, ng0);
    t2 = (t0 + 5576);
    t4 = (t0 + 3376);
    t5 = (t4 + 56U);
    t6 = *((char **)t5);
    t7 = (t6 + 56U);
    t8 = *((char **)t7);
    memcpy(t8, t2, 8U);
    xsi_driver_first_trans_fast(t4);
    xsi_set_current_line(61, ng0);
    t2 = (t0 + 5584);
    t4 = (t0 + 3440);
    t5 = (t4 + 56U);
    t6 = *((char **)t5);
    t7 = (t6 + 56U);
    t8 = *((char **)t7);
    memcpy(t8, t2, 8U);
    xsi_driver_first_trans_fast(t4);
    xsi_set_current_line(62, ng0);

LAB17:    *((char **)t1) = &&LAB18;

LAB1:    return;
LAB5:    xsi_set_current_line(57, ng0);
    t4 = (t0 + 1352U);
    t5 = *((char **)t4);
    t4 = (t0 + 5468U);
    t6 = (t0 + 5572);
    t8 = (t12 + 0U);
    t13 = (t8 + 0U);
    *((int *)t13) = 0;
    t13 = (t8 + 4U);
    *((int *)t13) = 3;
    t13 = (t8 + 8U);
    *((int *)t13) = 1;
    t14 = (3 - 0);
    t15 = (t14 * 1);
    t15 = (t15 + 1);
    t13 = (t8 + 12U);
    *((unsigned int *)t13) = t15;
    t13 = ieee_p_3620187407_sub_767668596_3965413181(IEEE_P_3620187407, t11, t5, t4, t6, t12);
    t16 = (t11 + 12U);
    t15 = *((unsigned int *)t16);
    t17 = (1U * t15);
    t18 = (4U != t17);
    if (t18 == 1)
        goto LAB8;

LAB9:    t19 = (t0 + 3504);
    t20 = (t19 + 56U);
    t21 = *((char **)t20);
    t22 = (t21 + 56U);
    t23 = *((char **)t22);
    memcpy(t23, t13, 4U);
    xsi_driver_first_trans_fast(t19);
    xsi_set_current_line(58, ng0);
    t24 = (100 * 1000LL);
    t2 = (t0 + 2800);
    xsi_process_wait(t2, t24);

LAB12:    *((char **)t1) = &&LAB13;
    goto LAB1;

LAB6:    t2 = (t0 + 5564);
    t9 = *((int *)t2);
    t3 = (t0 + 5568);
    t10 = *((int *)t3);
    if (t9 == t10)
        goto LAB7;

LAB14:    t14 = (t9 + 1);
    t9 = t14;
    t4 = (t0 + 5564);
    *((int *)t4) = t9;
    goto LAB4;

LAB8:    xsi_size_not_matching(4U, t17, 0);
    goto LAB9;

LAB10:    goto LAB6;

LAB11:    goto LAB10;

LAB13:    goto LAB11;

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
