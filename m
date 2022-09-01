From: Anup Patel <anup@brainfault.org>
Date: Thu, 1 Sep 2022 16:59:39 +0530
Subject: [PATCH 6/7] lib: sbi: Print platform PMU device at boot-time
In-Reply-To: <CAOnJCUL2kD_8dbwyBOX1XbaGizUqRAymPUhRWddavtG=aLojMA@mail.gmail.com>
References: <20220825045144.752619-1-apatel@ventanamicro.com>
 <20220825045144.752619-7-apatel@ventanamicro.com> <CAOnJCUL2kD_8dbwyBOX1XbaGizUqRAymPUhRWddavtG=aLojMA@mail.gmail.com>
Message-ID: <CAAhSdy17yy6+9fRpY=gT_E1t4Vgd9zq-0jq2s4h008mHhA5uWg@mail.gmail.com>
List-Id: <opensbi.lists.infradead.org>
To: opensbi@lists.infradead.org
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit

On Sat, Aug 27, 2022 at 4:56 AM Atish Patra <atishp@atishpatra.org> wrote:
>
>
>
> On Wed, Aug 24, 2022 at 9:52 PM Anup Patel <apatel@ventanamicro.com> wrote:
>>
>> Let us print the platform PMU device name at the boot-time so that users
>> know whether the underlying platform has custom per-HART PMU operations.
>>
>> Signed-off-by: Anup Patel <apatel@ventanamicro.com>
>> Reviewed-by: Andrew Jones <ajones@ventanamicro.com>
>> ---
>>  lib/sbi/sbi_init.c | 4 ++++
>>  1 file changed, 4 insertions(+)
>>
>> diff --git a/lib/sbi/sbi_init.c b/lib/sbi/sbi_init.c
>> index d57efa7..a8500e5 100644
>> --- a/lib/sbi/sbi_init.c
>> +++ b/lib/sbi/sbi_init.c
>> @@ -63,6 +63,7 @@ static void sbi_boot_print_banner(struct sbi_scratch *scratch)
>>  static void sbi_boot_print_general(struct sbi_scratch *scratch)
>>  {
>>         char str[128];
>> +       const struct sbi_pmu_device *pdev;
>>         const struct sbi_hsm_device *hdev;
>>         const struct sbi_ipi_device *idev;
>>         const struct sbi_timer_device *tdev;
>> @@ -93,6 +94,9 @@ static void sbi_boot_print_general(struct sbi_scratch *scratch)
>>         hdev = sbi_hsm_get_device();
>>         sbi_printf("Platform HSM Device       : %s\n",
>>                    (hdev) ? hdev->name : "---");
>> +       pdev = sbi_pmu_get_device();
>> +       sbi_printf("Platform PMU Device       : %s\n",
>> +                  (pdev) ? pdev->name : "---");
>
>
> Just a nit pick thought ;)
> Should we only print the entire line if pdev is present ?

In general, I agree with your suggestion but for consistency
let us keep it as-is. You can send a separate patch print
device for various things only if xdev != NULL.

>
>>
>>         srdev = sbi_system_reset_get_device(SBI_SRST_RESET_TYPE_COLD_REBOOT, 0);
>>         sbi_printf("Platform Reboot Device    : %s\n",
>>                    (srdev) ? srdev->name : "---");
>> --
>> 2.34.1
>>
>
> Otherwise, LGTM.
>
> Reviewed-by: Atish Patra <atishp@rivosinc.com>
>
> --
> Regards,
> Atish

Regards,
Anup

