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
static const char *ng0 = "C:/Users/Hau Tran/Desktop/vhdl/PWM_signal/PWM_signal.vhd";
extern char *IEEE_P_1242562249;
extern char *IEEE_P_2592010699;

int ieee_p_1242562249_sub_1657552908_1035706684(char *, char *, char *);
unsigned char ieee_p_2592010699_sub_1744673427_503743352(char *, char *, unsigned int , unsigned int );


static void work_a_0773104431_3212880686_p_0(char *t0)
{
    char *t1;
    char *t2;
    int t3;
    char *t4;
    char *t5;
    char *t6;
    char *t7;
    char *t8;
    char *t9;

LAB0:    xsi_set_current_line(61, ng0);

LAB3:    t1 = (t0 + 1192U);
    t2 = *((char **)t1);
    t1 = (t0 + 8256U);
    t3 = ieee_p_1242562249_sub_1657552908_1035706684(IEEE_P_1242562249, t2, t1);
    t4 = (t0 + 5000);
    t5 = (t4 + 56U);
    t6 = *((char **)t5);
    t7 = (t6 + 56U);
    t8 = *((char **)t7);
    *((int *)t8) = t3;
    xsi_driver_first_trans_fast(t4);

LAB2:    t9 = (t0 + 4888);
    *((int *)t9) = 1;

LAB1:    return;
LAB4:    goto LAB2;

}

static void work_a_0773104431_3212880686_p_1(char *t0)
{
    char *t1;
    char *t2;
    unsigned char t3;
    char *t4;
    char *t5;
    char *t6;
    char *t7;
    char *t8;

LAB0:    xsi_set_current_line(62, ng0);

LAB3:    t1 = (t0 + 1672U);
    t2 = *((char **)t1);
    t3 = *((unsigned char *)t2);
    t1 = (t0 + 5064);
    t4 = (t1 + 56U);
    t5 = *((char **)t4);
    t6 = (t5 + 56U);
    t7 = *((char **)t6);
    *((unsigned char *)t7) = t3;
    xsi_driver_first_trans_fast_port(t1);

LAB2:    t8 = (t0 + 4904);
    *((int *)t8) = 1;

LAB1:    return;
LAB4:    goto LAB2;

}

static void work_a_0773104431_3212880686_p_2(char *t0)
{
    char *t1;
    unsigned char t2;
    char *t3;
    char *t4;
    unsigned char t5;
    unsigned char t6;
    char *t7;
    int t8;
    char *t9;
    int t10;
    unsigned char t11;
    char *t12;
    int t13;
    int t14;
    char *t15;
    char *t16;
    char *t17;
    char *t18;

LAB0:    xsi_set_current_line(68, ng0);
    t1 = (t0 + 1472U);
    t2 = ieee_p_2592010699_sub_1744673427_503743352(IEEE_P_2592010699, t1, 0U, 0U);
    if (t2 != 0)
        goto LAB2;

LAB4:
LAB3:    t1 = (t0 + 4920);
    *((int *)t1) = 1;

LAB1:    return;
LAB2:    xsi_set_current_line(69, ng0);
    t3 = (t0 + 1352U);
    t4 = *((char **)t3);
    t5 = *((unsigned char *)t4);
    t6 = (t5 == (unsigned char)2);
    if (t6 != 0)
        goto LAB5;

LAB7:    xsi_set_current_line(90, ng0);
    t1 = (t0 + 5192);
    t3 = (t1 + 56U);
    t4 = *((char **)t3);
    t7 = (t4 + 56U);
    t9 = *((char **)t7);
    *((unsigned char *)t9) = (unsigned char)2;
    xsi_driver_first_trans_fast(t1);

LAB6:    goto LAB3;

LAB5:    xsi_set_current_line(71, ng0);
    t3 = (t0 + 1832U);
    t7 = *((char **)t3);
    t8 = *((int *)t7);
    t3 = (t0 + 2968U);
    t9 = *((char **)t3);
    t10 = *((int *)t9);
    t11 = (t8 < t10);
    if (t11 != 0)
        goto LAB8;

LAB10:    xsi_set_current_line(85, ng0);
    t1 = (t0 + 5128);
    t3 = (t1 + 56U);
    t4 = *((char **)t3);
    t7 = (t4 + 56U);
    t9 = *((char **)t7);
    *((int *)t9) = 0;
    xsi_driver_first_trans_fast(t1);
    xsi_set_current_line(86, ng0);
    t1 = (t0 + 5320);
    t3 = (t1 + 56U);
    t4 = *((char **)t3);
    t7 = (t4 + 56U);
    t9 = *((char **)t7);
    *((int *)t9) = 0;
    xsi_driver_first_trans_fast(t1);

LAB9:    goto LAB6;

LAB8:    xsi_set_current_line(72, ng0);
    t3 = (t0 + 1832U);
    t12 = *((char **)t3);
    t13 = *((int *)t12);
    t14 = (t13 + 1);
    t3 = (t0 + 5128);
    t15 = (t3 + 56U);
    t16 = *((char **)t15);
    t17 = (t16 + 56U);
    t18 = *((char **)t17);
    *((int *)t18) = t14;
    xsi_driver_first_trans_fast(t3);
    xsi_set_current_line(73, ng0);
    t1 = (t0 + 1992U);
    t3 = *((char **)t1);
    t8 = *((int *)t3);
    t1 = (t0 + 2152U);
    t4 = *((char **)t1);
    t10 = *((int *)t4);
    t2 = (t8 < t10);
    if (t2 != 0)
        goto LAB11;

LAB13:    xsi_set_current_line(82, ng0);
    t1 = (t0 + 5192);
    t3 = (t1 + 56U);
    t4 = *((char **)t3);
    t7 = (t4 + 56U);
    t9 = *((char **)t7);
    *((unsigned char *)t9) = (unsigned char)2;
    xsi_driver_first_trans_fast(t1);

LAB12:    goto LAB9;

LAB11:    xsi_set_current_line(74, ng0);
    t1 = (t0 + 5192);
    t7 = (t1 + 56U);
    t9 = *((char **)t7);
    t12 = (t9 + 56U);
    t15 = *((char **)t12);
    *((unsigned char *)t15) = (unsigned char)3;
    xsi_driver_first_trans_fast(t1);
    xsi_set_current_line(75, ng0);
    t1 = (t0 + 2312U);
    t3 = *((char **)t1);
    t8 = *((int *)t3);
    t1 = (t0 + 3088U);
    t4 = *((char **)t1);
    t10 = *((int *)t4);
    t2 = (t8 < t10);
    if (t2 != 0)
        goto LAB14;

LAB16:    xsi_set_current_line(78, ng0);
    t1 = (t0 + 5256);
    t3 = (t1 + 56U);
    t4 = *((char **)t3);
    t7 = (t4 + 56U);
    t9 = *((char **)t7);
    *((int *)t9) = 0;
    xsi_driver_first_trans_fast(t1);
    xsi_set_current_line(79, ng0);
    t1 = (t0 + 1992U);
    t3 = *((char **)t1);
    t8 = *((int *)t3);
    t10 = (t8 + 1);
    t1 = (t0 + 5320);
    t4 = (t1 + 56U);
    t7 = *((char **)t4);
    t9 = (t7 + 56U);
    t12 = *((char **)t9);
    *((int *)t12) = t10;
    xsi_driver_first_trans_fast(t1);

LAB15:    goto LAB12;

LAB14:    xsi_set_current_line(76, ng0);
    t1 = (t0 + 2312U);
    t7 = *((char **)t1);
    t13 = *((int *)t7);
    t14 = (t13 + 1);
    t1 = (t0 + 5256);
    t9 = (t1 + 56U);
    t12 = *((char **)t9);
    t15 = (t12 + 56U);
    t16 = *((char **)t15);
    *((int *)t16) = t14;
    xsi_driver_first_trans_fast(t1);
    goto LAB15;

}


extern void work_a_0773104431_3212880686_init()
{
	static char *pe[] = {(void *)work_a_0773104431_3212880686_p_0,(void *)work_a_0773104431_3212880686_p_1,(void *)work_a_0773104431_3212880686_p_2};
	xsi_register_didat("work_a_0773104431_3212880686", "isim/PWM_signal_isim_beh.exe.sim/work/a_0773104431_3212880686.didat");
	xsi_register_executes(pe);
}
