From: Jessica Clarke <jrtc27@jrtc27.com>
Date: Fri, 14 May 2021 02:59:56 +0100
Subject: [PATCH] lib: utils/serial: Support Synopsys DesignWare APB UART
In-Reply-To: <CAEUhbmVXOq8GjXCw6BmrV6NMenRtXQLV=mWepgeRWj444pLNBw@mail.gmail.com>
References: <20210514011613.2183141-1-bmeng.cn@gmail.com>
 <297EBE3C-8771-4815-A942-0B95A67115CB@jrtc27.com>
 <CAEUhbmVXOq8GjXCw6BmrV6NMenRtXQLV=mWepgeRWj444pLNBw@mail.gmail.com>
Message-ID: <EDA30902-60C6-4F68-A27A-17EB13775BF9@jrtc27.com>
List-Id: <opensbi.lists.infradead.org>
To: opensbi@lists.infradead.org
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit

On 14 May 2021, at 02:27, Bin Meng <bmeng.cn@gmail.com> wrote:
> 
> On Fri, May 14, 2021 at 9:19 AM Jessica Clarke <jrtc27@jrtc27.com> wrote:
>> 
>> On 14 May 2021, at 02:16, Bin Meng <bmeng.cn@gmail.com> wrote:
>>> 
>>> Synopsys DesignWare APB UART is seen on the StarFive JH7100 SoC.
>>> Its programming interface is compatible with the existing 8250
>>> UART driver. Simply add its compatible string to the driver makes
>>> it work with the StarFive JH7100 SoC on a BeagleV board.
>>> 
>>> With this patch, the generic platform firmware can be used out of
>>> the box on the BeagleV board.
>>> 
>>> Signed-off-by: Bin Meng <bmeng.cn@gmail.com>
>>> ---
>>> 
>>> lib/utils/serial/fdt_serial_uart8250.c | 1 +
>>> 1 file changed, 1 insertion(+)
>>> 
>>> diff --git a/lib/utils/serial/fdt_serial_uart8250.c b/lib/utils/serial/fdt_serial_uart8250.c
>>> index 918193a..36f364c 100644
>>> --- a/lib/utils/serial/fdt_serial_uart8250.c
>>> +++ b/lib/utils/serial/fdt_serial_uart8250.c
>>> @@ -28,6 +28,7 @@ static int serial_uart8250_init(void *fdt, int nodeoff,
>>> static const struct fdt_match serial_uart8250_match[] = {
>>>      { .compatible = "ns16550" },
>>>      { .compatible = "ns16550a" },
>>> +     { .compatible = "snps,dw-apb-uart" },
>> 
>> If it?s compatible, why does it not use
>> 
>>  compatible = ?snps,dw-apb-uart?, ?ns16550?;
>> 
>> or similar in its FDT?
> 
> Good question. By looking at the Linux kernel driver, it is supported
> as a variant of 8250 (drivers/tty/serial/8250/8250_dw.c).
> 
> I have not looked into details, but I suspect there are some minor
> oddities which matter for the kernel. The existing driver is enough to
> make OpenSBI happy.

It seems there are various additional clocks and resets you may need to handle
(baudclk is required, apb_pclk is optional and there?s an optional reset too).
For this particular board the FDT has a them clocks as all fixed-clock, but in
general this is not a correct implementation of the driver, as the clocks must
be enabled when attaching.

Jess


