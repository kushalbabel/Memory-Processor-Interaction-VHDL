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

/* This file is designed for use with ISim build 0xfbc00daa */

#define XSI_HIDE_SYMBOL_SPEC true
#include "xsi.h"
#include <memory.h>
#ifdef __GNUC__
#include <stdlib.h>
#else
#include <malloc.h>
#define alloca _alloca
#endif
static const char *ng0 = "/home/mukund/scopemaxx_project/smart_arbiter.vhd";
extern char *IEEE_P_3620187407;

unsigned char ieee_p_3620187407_sub_1306455576380142462_3965413181(char *, char *, char *, char *, char *);


static void work_a_1398330272_3212880686_p_0(char *t0)
{
    char t11[16];
    char t21[16];
    char *t1;
    char *t2;
    unsigned char t3;
    unsigned char t4;
    char *t5;
    char *t6;
    char *t7;
    char *t8;
    char *t9;
    char *t10;
    int t12;
    unsigned int t13;
    unsigned char t14;
    unsigned char t15;
    char *t16;
    char *t17;
    char *t18;
    char *t19;
    char *t20;
    int t22;
    char *t23;
    char *t24;

LAB0:    xsi_set_current_line(58, ng0);
    t1 = (t0 + 1192U);
    t2 = *((char **)t1);
    t3 = *((unsigned char *)t2);
    t4 = (t3 == (unsigned char)3);
    if (t4 != 0)
        goto LAB2;

LAB4:    t1 = (t0 + 1032U);
    t2 = *((char **)t1);
    t3 = *((unsigned char *)t2);
    t4 = (t3 == (unsigned char)3);
    if (t4 != 0)
        goto LAB5;

LAB6:
LAB3:    t1 = (t0 + 5784);
    *((int *)t1) = 1;

LAB1:    return;
LAB2:    xsi_set_current_line(59, ng0);
    t1 = xsi_get_transient_memory(5U);
    memset(t1, 0, 5U);
    t5 = t1;
    memset(t5, (unsigned char)2, 5U);
    t6 = (t0 + 5864);
    t7 = (t6 + 56U);
    t8 = *((char **)t7);
    t9 = (t8 + 56U);
    t10 = *((char **)t9);
    memcpy(t10, t1, 5U);
    xsi_driver_first_trans_fast_port(t6);
    xsi_set_current_line(60, ng0);
    t1 = (t0 + 9208);
    t5 = (t0 + 5928);
    t6 = (t5 + 56U);
    t7 = *((char **)t6);
    t8 = (t7 + 56U);
    t9 = *((char **)t8);
    memcpy(t9, t1, 3U);
    xsi_driver_first_trans_fast(t5);
    xsi_set_current_line(61, ng0);
    t1 = (t0 + 5992);
    t2 = (t1 + 56U);
    t5 = *((char **)t2);
    t6 = (t5 + 56U);
    t7 = *((char **)t6);
    *((unsigned char *)t7) = (unsigned char)2;
    xsi_driver_first_trans_fast_port(t1);
    goto LAB3;

LAB5:    xsi_set_current_line(63, ng0);
    t1 = (t0 + 9211);
    t6 = (t0 + 3408U);
    t7 = *((char **)t6);
    t6 = (t7 + 0);
    memcpy(t6, t1, 5U);
    xsi_set_current_line(65, ng0);
    t1 = (t0 + 1832U);
    t2 = *((char **)t1);
    t1 = (t0 + 3528U);
    t5 = *((char **)t1);
    t1 = (t5 + 0);
    memcpy(t1, t2, 5U);
    xsi_set_current_line(66, ng0);
    t1 = (t0 + 2152U);
    t2 = *((char **)t1);
    t1 = (t0 + 3648U);
    t5 = *((char **)t1);
    t1 = (t5 + 0);
    memcpy(t1, t2, 5U);
    xsi_set_current_line(67, ng0);
    t1 = (t0 + 2472U);
    t2 = *((char **)t1);
    t1 = (t0 + 3768U);
    t5 = *((char **)t1);
    t1 = (t5 + 0);
    memcpy(t1, t2, 5U);
    xsi_set_current_line(68, ng0);
    t1 = (t0 + 2792U);
    t2 = *((char **)t1);
    t1 = (t0 + 3888U);
    t5 = *((char **)t1);
    t1 = (t5 + 0);
    memcpy(t1, t2, 5U);
    xsi_set_current_line(70, ng0);
    t1 = (t0 + 1672U);
    t2 = *((char **)t1);
    t1 = (t0 + 4008U);
    t5 = *((char **)t1);
    t1 = (t5 + 0);
    memcpy(t1, t2, 5U);
    xsi_set_current_line(71, ng0);
    t1 = (t0 + 1992U);
    t2 = *((char **)t1);
    t1 = (t0 + 4128U);
    t5 = *((char **)t1);
    t1 = (t5 + 0);
    memcpy(t1, t2, 5U);
    xsi_set_current_line(72, ng0);
    t1 = (t0 + 2312U);
    t2 = *((char **)t1);
    t1 = (t0 + 4248U);
    t5 = *((char **)t1);
    t1 = (t5 + 0);
    memcpy(t1, t2, 5U);
    xsi_set_current_line(73, ng0);
    t1 = (t0 + 2632U);
    t2 = *((char **)t1);
    t1 = (t0 + 4368U);
    t5 = *((char **)t1);
    t1 = (t5 + 0);
    memcpy(t1, t2, 5U);
    xsi_set_current_line(75, ng0);
    t1 = (t0 + 9216);
    t5 = (t0 + 4488U);
    t6 = *((char **)t5);
    t5 = (t6 + 0);
    memcpy(t5, t1, 5U);
    xsi_set_current_line(77, ng0);
    t1 = (t0 + 3408U);
    t2 = *((char **)t1);
    t1 = (t0 + 9088U);
    t5 = (t0 + 3528U);
    t6 = *((char **)t5);
    t5 = (t0 + 9088U);
    t3 = ieee_std_logic_unsigned_greater_stdv_stdv(IEEE_P_3620187407, t2, t1, t6, t5);
    if (t3 != 0)
        goto LAB7;

LAB9:    xsi_set_current_line(79, ng0);
    t7 = (t0 + 9221);
    t9 = (t0 + 4488U);
    t10 = *((char **)t9);
    t9 = (t10 + 0);
    memcpy(t9, t7, 5U);
    xsi_set_current_line(80, ng0);
    t1 = (t0 + 3528U);
    t2 = *((char **)t1);
    t1 = (t0 + 3408U);
    t5 = *((char **)t1);
    t1 = (t5 + 0);
    memcpy(t1, t2, 5U);

LAB8:    xsi_set_current_line(83, ng0);
    t1 = (t0 + 3408U);
    t2 = *((char **)t1);
    t1 = (t0 + 9088U);
    t5 = (t0 + 3648U);
    t6 = *((char **)t5);
    t5 = (t0 + 9088U);
    t3 = ieee_std_logic_unsigned_greater_stdv_stdv(IEEE_P_3620187407, t2, t1, t6, t5);
    if (t3 != 0)
        goto LAB10;

LAB12:    xsi_set_current_line(85, ng0);
    t7 = (t0 + 9226);
    t9 = (t0 + 4488U);
    t10 = *((char **)t9);
    t9 = (t10 + 0);
    memcpy(t9, t7, 5U);
    xsi_set_current_line(86, ng0);
    t1 = (t0 + 3648U);
    t2 = *((char **)t1);
    t1 = (t0 + 3408U);
    t5 = *((char **)t1);
    t1 = (t5 + 0);
    memcpy(t1, t2, 5U);

LAB11:    xsi_set_current_line(89, ng0);
    t1 = (t0 + 3408U);
    t2 = *((char **)t1);
    t1 = (t0 + 9088U);
    t5 = (t0 + 3768U);
    t6 = *((char **)t5);
    t5 = (t0 + 9088U);
    t3 = ieee_std_logic_unsigned_greater_stdv_stdv(IEEE_P_3620187407, t2, t1, t6, t5);
    if (t3 != 0)
        goto LAB13;

LAB15:    xsi_set_current_line(91, ng0);
    t7 = (t0 + 9231);
    t9 = (t0 + 4488U);
    t10 = *((char **)t9);
    t9 = (t10 + 0);
    memcpy(t9, t7, 5U);
    xsi_set_current_line(92, ng0);
    t1 = (t0 + 3768U);
    t2 = *((char **)t1);
    t1 = (t0 + 3408U);
    t5 = *((char **)t1);
    t1 = (t5 + 0);
    memcpy(t1, t2, 5U);

LAB14:    xsi_set_current_line(95, ng0);
    t1 = (t0 + 3408U);
    t2 = *((char **)t1);
    t1 = (t0 + 9088U);
    t5 = (t0 + 3888U);
    t6 = *((char **)t5);
    t5 = (t0 + 9088U);
    t3 = ieee_std_logic_unsigned_greater_stdv_stdv(IEEE_P_3620187407, t2, t1, t6, t5);
    if (t3 != 0)
        goto LAB16;

LAB18:    xsi_set_current_line(97, ng0);
    t7 = (t0 + 9236);
    t9 = (t0 + 4488U);
    t10 = *((char **)t9);
    t9 = (t10 + 0);
    memcpy(t9, t7, 5U);
    xsi_set_current_line(98, ng0);
    t1 = (t0 + 3888U);
    t2 = *((char **)t1);
    t1 = (t0 + 3408U);
    t5 = *((char **)t1);
    t1 = (t5 + 0);
    memcpy(t1, t2, 5U);

LAB17:    xsi_set_current_line(101, ng0);
    t1 = (t0 + 3408U);
    t2 = *((char **)t1);
    t1 = (t0 + 9088U);
    t5 = (t0 + 4008U);
    t6 = *((char **)t5);
    t5 = (t0 + 9088U);
    t3 = ieee_std_logic_unsigned_greater_stdv_stdv(IEEE_P_3620187407, t2, t1, t6, t5);
    if (t3 != 0)
        goto LAB19;

LAB21:    xsi_set_current_line(103, ng0);
    t7 = (t0 + 9241);
    t9 = (t0 + 4488U);
    t10 = *((char **)t9);
    t9 = (t10 + 0);
    memcpy(t9, t7, 5U);
    xsi_set_current_line(104, ng0);
    t1 = (t0 + 4008U);
    t2 = *((char **)t1);
    t1 = (t0 + 3408U);
    t5 = *((char **)t1);
    t1 = (t5 + 0);
    memcpy(t1, t2, 5U);

LAB20:    xsi_set_current_line(107, ng0);
    t1 = (t0 + 3408U);
    t2 = *((char **)t1);
    t1 = (t0 + 9088U);
    t5 = (t0 + 4128U);
    t6 = *((char **)t5);
    t5 = (t0 + 9088U);
    t3 = ieee_std_logic_unsigned_greater_stdv_stdv(IEEE_P_3620187407, t2, t1, t6, t5);
    if (t3 != 0)
        goto LAB22;

LAB24:    xsi_set_current_line(109, ng0);
    t7 = (t0 + 9246);
    t9 = (t0 + 4488U);
    t10 = *((char **)t9);
    t9 = (t10 + 0);
    memcpy(t9, t7, 5U);
    xsi_set_current_line(110, ng0);
    t1 = (t0 + 4128U);
    t2 = *((char **)t1);
    t1 = (t0 + 3408U);
    t5 = *((char **)t1);
    t1 = (t5 + 0);
    memcpy(t1, t2, 5U);

LAB23:    xsi_set_current_line(113, ng0);
    t1 = (t0 + 3408U);
    t2 = *((char **)t1);
    t1 = (t0 + 9088U);
    t5 = (t0 + 4248U);
    t6 = *((char **)t5);
    t5 = (t0 + 9088U);
    t3 = ieee_std_logic_unsigned_greater_stdv_stdv(IEEE_P_3620187407, t2, t1, t6, t5);
    if (t3 != 0)
        goto LAB25;

LAB27:    xsi_set_current_line(115, ng0);
    t7 = (t0 + 9251);
    t9 = (t0 + 4488U);
    t10 = *((char **)t9);
    t9 = (t10 + 0);
    memcpy(t9, t7, 5U);
    xsi_set_current_line(116, ng0);
    t1 = (t0 + 4248U);
    t2 = *((char **)t1);
    t1 = (t0 + 3408U);
    t5 = *((char **)t1);
    t1 = (t5 + 0);
    memcpy(t1, t2, 5U);

LAB26:    xsi_set_current_line(119, ng0);
    t1 = (t0 + 3408U);
    t2 = *((char **)t1);
    t1 = (t0 + 9088U);
    t5 = (t0 + 4368U);
    t6 = *((char **)t5);
    t5 = (t0 + 9088U);
    t3 = ieee_std_logic_unsigned_greater_stdv_stdv(IEEE_P_3620187407, t2, t1, t6, t5);
    if (t3 != 0)
        goto LAB28;

LAB30:    xsi_set_current_line(121, ng0);
    t7 = (t0 + 9256);
    t9 = (t0 + 4488U);
    t10 = *((char **)t9);
    t9 = (t10 + 0);
    memcpy(t9, t7, 5U);
    xsi_set_current_line(122, ng0);
    t1 = (t0 + 4368U);
    t2 = *((char **)t1);
    t1 = (t0 + 3408U);
    t5 = *((char **)t1);
    t1 = (t5 + 0);
    memcpy(t1, t2, 5U);

LAB29:    xsi_set_current_line(125, ng0);
    t1 = (t0 + 4488U);
    t2 = *((char **)t1);
    t1 = (t0 + 5864);
    t5 = (t1 + 56U);
    t6 = *((char **)t5);
    t7 = (t6 + 56U);
    t8 = *((char **)t7);
    memcpy(t8, t2, 5U);
    xsi_driver_first_trans_fast_port(t1);
    xsi_set_current_line(127, ng0);
    t1 = (t0 + 3112U);
    t2 = *((char **)t1);
    t1 = (t0 + 9072U);
    t5 = (t0 + 9261);
    t7 = (t11 + 0U);
    t8 = (t7 + 0U);
    *((int *)t8) = 0;
    t8 = (t7 + 4U);
    *((int *)t8) = 2;
    t8 = (t7 + 8U);
    *((int *)t8) = 1;
    t12 = (2 - 0);
    t13 = (t12 * 1);
    t13 = (t13 + 1);
    t8 = (t7 + 12U);
    *((unsigned int *)t8) = t13;
    t4 = ieee_std_logic_unsigned_equal_stdv_stdv(IEEE_P_3620187407, t2, t1, t5, t11);
    if (t4 == 1)
        goto LAB34;

LAB35:    t3 = (unsigned char)0;

LAB36:    if (t3 != 0)
        goto LAB31;

LAB33:
LAB32:    xsi_set_current_line(131, ng0);
    t1 = (t0 + 3112U);
    t2 = *((char **)t1);
    t1 = (t0 + 9072U);
    t5 = (t0 + 9267);
    t7 = (t11 + 0U);
    t8 = (t7 + 0U);
    *((int *)t8) = 0;
    t8 = (t7 + 4U);
    *((int *)t8) = 2;
    t8 = (t7 + 8U);
    *((int *)t8) = 1;
    t12 = (2 - 0);
    t13 = (t12 * 1);
    t13 = (t13 + 1);
    t8 = (t7 + 12U);
    *((unsigned int *)t8) = t13;
    t4 = ieee_std_logic_unsigned_equal_stdv_stdv(IEEE_P_3620187407, t2, t1, t5, t11);
    if (t4 == 1)
        goto LAB40;

LAB41:    t3 = (unsigned char)0;

LAB42:    if (t3 != 0)
        goto LAB37;

LAB39:
LAB38:    xsi_set_current_line(136, ng0);
    t1 = (t0 + 3112U);
    t2 = *((char **)t1);
    t1 = (t0 + 9072U);
    t5 = (t0 + 9278);
    t7 = (t11 + 0U);
    t8 = (t7 + 0U);
    *((int *)t8) = 0;
    t8 = (t7 + 4U);
    *((int *)t8) = 2;
    t8 = (t7 + 8U);
    *((int *)t8) = 1;
    t12 = (2 - 0);
    t13 = (t12 * 1);
    t13 = (t13 + 1);
    t8 = (t7 + 12U);
    *((unsigned int *)t8) = t13;
    t3 = ieee_std_logic_unsigned_equal_stdv_stdv(IEEE_P_3620187407, t2, t1, t5, t11);
    if (t3 != 0)
        goto LAB43;

LAB45:
LAB44:    goto LAB3;

LAB7:    goto LAB8;

LAB10:    goto LAB11;

LAB13:    goto LAB14;

LAB16:    goto LAB17;

LAB19:    goto LAB20;

LAB22:    goto LAB23;

LAB25:    goto LAB26;

LAB28:    goto LAB29;

LAB31:    xsi_set_current_line(128, ng0);
    t8 = (t0 + 9264);
    t16 = (t0 + 5928);
    t17 = (t16 + 56U);
    t18 = *((char **)t17);
    t19 = (t18 + 56U);
    t20 = *((char **)t19);
    memcpy(t20, t8, 3U);
    xsi_driver_first_trans_fast(t16);
    goto LAB32;

LAB34:    t8 = (t0 + 1352U);
    t9 = *((char **)t8);
    t14 = *((unsigned char *)t9);
    t15 = (t14 == (unsigned char)3);
    t3 = t15;
    goto LAB36;

LAB37:    xsi_set_current_line(132, ng0);
    t18 = (t0 + 5992);
    t19 = (t18 + 56U);
    t20 = *((char **)t19);
    t23 = (t20 + 56U);
    t24 = *((char **)t23);
    *((unsigned char *)t24) = (unsigned char)3;
    xsi_driver_first_trans_fast_port(t18);
    xsi_set_current_line(133, ng0);
    t1 = (t0 + 9275);
    t5 = (t0 + 5928);
    t6 = (t5 + 56U);
    t7 = *((char **)t6);
    t8 = (t7 + 56U);
    t9 = *((char **)t8);
    memcpy(t9, t1, 3U);
    xsi_driver_first_trans_fast(t5);
    goto LAB38;

LAB40:    t8 = (t0 + 4488U);
    t9 = *((char **)t8);
    t8 = (t0 + 9088U);
    t10 = (t0 + 9270);
    t17 = (t21 + 0U);
    t18 = (t17 + 0U);
    *((int *)t18) = 0;
    t18 = (t17 + 4U);
    *((int *)t18) = 4;
    t18 = (t17 + 8U);
    *((int *)t18) = 1;
    t22 = (4 - 0);
    t13 = (t22 * 1);
    t13 = (t13 + 1);
    t18 = (t17 + 12U);
    *((unsigned int *)t18) = t13;
    t14 = ieee_p_3620187407_sub_1306455576380142462_3965413181(IEEE_P_3620187407, t9, t8, t10, t21);
    t3 = t14;
    goto LAB42;

LAB43:    xsi_set_current_line(137, ng0);
    t8 = (t0 + 5992);
    t9 = (t8 + 56U);
    t10 = *((char **)t9);
    t16 = (t10 + 56U);
    t17 = *((char **)t16);
    *((unsigned char *)t17) = (unsigned char)2;
    xsi_driver_first_trans_fast_port(t8);
    xsi_set_current_line(138, ng0);
    t1 = (t0 + 9281);
    t5 = (t0 + 5928);
    t6 = (t5 + 56U);
    t7 = *((char **)t6);
    t8 = (t7 + 56U);
    t9 = *((char **)t8);
    memcpy(t9, t1, 3U);
    xsi_driver_first_trans_fast(t5);
    goto LAB44;

}


extern void work_a_1398330272_3212880686_init()
{
	static char *pe[] = {(void *)work_a_1398330272_3212880686_p_0};
	xsi_register_didat("work_a_1398330272_3212880686", "isim/scopemaxx_tb3_isim_beh.exe.sim/work/a_1398330272_3212880686.didat");
	xsi_register_executes(pe);
}
