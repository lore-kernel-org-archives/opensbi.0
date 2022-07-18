From: Jessica Clarke <jrtc27@jrtc27.com>
Date: Mon, 18 Jul 2022 19:39:23 +0100
Subject: [PATCH 2/4] lib: utils/serial: Initialize platform_uart_data to
 zero
In-Reply-To: <20220718183533.7pdyuyfpae6xjfxc@kamzik>
References: <20220718172028.2006166-1-ajones@ventanamicro.com>
 <20220718172028.2006166-3-ajones@ventanamicro.com>
 <1D1800C8-676E-43E0-9F22-29DC5862E994@jrtc27.com>
 <20220718183533.7pdyuyfpae6xjfxc@kamzik>
Message-ID: <CD32E693-6D4E-4F48-AE14-4F47A08AD491@jrtc27.com>
List-Id: <opensbi.lists.infradead.org>
To: opensbi@lists.infradead.org
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit

On 18 Jul 2022, at 19:35, Andrew Jones <ajones@ventanamicro.com> wrote:
> 
> On Mon, Jul 18, 2022 at 06:42:40PM +0100, Jessica Clarke wrote:
>> On 18 Jul 2022, at 18:20, Andrew Jones <ajones@ventanamicro.com> wrote:
>>> 
>>> While it doesn't look like there are any current cases of using
>>> uninitialized data, let's zero all the UART data members to be
>>> safe. Zero may not actually be better than a random number in
>>> some cases, so all structure members should still be validated
>>> before use, but at least zero is usually easier to debug than
>>> some random stack garbage...
>> 
>> If fdt_parse_foo_uart_node leaves the platform_uart_data uninitialised
>> (at least, parts that matter) then that seems like a bug to me. This
>> just masks such bugs from any kind of sanitiser...
> 
> Hi Jess,
> 
> That's an interesting approach. Which tool(s) will point that out?
> I just tried compiling with both gcc[1] and clang[2], noting that we
> compile with -Wall, but neither complained when I purposely commented
> out a used UART field.
> 
> [1] https://github.com/riscv/riscv-gnu-toolchain
> [2] clang-14.0.0-1.fc36.x86_64

Like other sanitisers it needs some runtime support, but MSan, i.e.
-fsanitize=memory.

Jess

> Thanks,
> drew
> 
>> 
>> Jess
>> 
>>> Signed-off-by: Andrew Jones <ajones@ventanamicro.com>
>>> ---
>>> lib/utils/serial/fdt_serial_gaisler.c       | 2 +-
>>> lib/utils/serial/fdt_serial_shakti.c        | 2 +-
>>> lib/utils/serial/fdt_serial_sifive.c        | 2 +-
>>> lib/utils/serial/fdt_serial_uart8250.c      | 2 +-
>>> lib/utils/serial/fdt_serial_xlnx_uartlite.c | 2 +-
>>> platform/fpga/openpiton/platform.c          | 2 +-
>>> 6 files changed, 6 insertions(+), 6 deletions(-)
>>> 
>>> diff --git a/lib/utils/serial/fdt_serial_gaisler.c b/lib/utils/serial/fdt_serial_gaisler.c
>>> index 9a9f9a8b7962..74988e34bcd8 100644
>>> --- a/lib/utils/serial/fdt_serial_gaisler.c
>>> +++ b/lib/utils/serial/fdt_serial_gaisler.c
>>> @@ -15,7 +15,7 @@ static int serial_gaisler_init(void *fdt, int nodeoff,
>>> 			       const struct fdt_match *match)
>>> {
>>> 	int rc;
>>> -	struct platform_uart_data uart;
>>> +	struct platform_uart_data uart = { 0 };
>>> 
>>> 	rc = fdt_parse_gaisler_uart_node(fdt, nodeoff, &uart);
>>> 	if (rc)
>>> diff --git a/lib/utils/serial/fdt_serial_shakti.c b/lib/utils/serial/fdt_serial_shakti.c
>>> index 4f91419ef53c..0e056303dbb5 100644
>>> --- a/lib/utils/serial/fdt_serial_shakti.c
>>> +++ b/lib/utils/serial/fdt_serial_shakti.c
>>> @@ -13,7 +13,7 @@ static int serial_shakti_init(void *fdt, int nodeoff,
>>> 				const struct fdt_match *match)
>>> {
>>> 	int rc;
>>> -	struct platform_uart_data uart;
>>> +	struct platform_uart_data uart = { 0 };
>>> 
>>> 	rc = fdt_parse_shakti_uart_node(fdt, nodeoff, &uart);
>>> 	if (rc)
>>> diff --git a/lib/utils/serial/fdt_serial_sifive.c b/lib/utils/serial/fdt_serial_sifive.c
>>> index f4c833c1573d..3ca10913eee3 100644
>>> --- a/lib/utils/serial/fdt_serial_sifive.c
>>> +++ b/lib/utils/serial/fdt_serial_sifive.c
>>> @@ -15,7 +15,7 @@ static int serial_sifive_init(void *fdt, int nodeoff,
>>> 				const struct fdt_match *match)
>>> {
>>> 	int rc;
>>> -	struct platform_uart_data uart;
>>> +	struct platform_uart_data uart = { 0 };
>>> 
>>> 	rc = fdt_parse_sifive_uart_node(fdt, nodeoff, &uart);
>>> 	if (rc)
>>> diff --git a/lib/utils/serial/fdt_serial_uart8250.c b/lib/utils/serial/fdt_serial_uart8250.c
>>> index 544b7416de42..0b95f2d9e44e 100644
>>> --- a/lib/utils/serial/fdt_serial_uart8250.c
>>> +++ b/lib/utils/serial/fdt_serial_uart8250.c
>>> @@ -15,7 +15,7 @@ static int serial_uart8250_init(void *fdt, int nodeoff,
>>> 				const struct fdt_match *match)
>>> {
>>> 	int rc;
>>> -	struct platform_uart_data uart;
>>> +	struct platform_uart_data uart = { 0 };
>>> 
>>> 	rc = fdt_parse_uart8250_node(fdt, nodeoff, &uart);
>>> 	if (rc)
>>> diff --git a/lib/utils/serial/fdt_serial_xlnx_uartlite.c b/lib/utils/serial/fdt_serial_xlnx_uartlite.c
>>> index 466e16e82d8c..9f04aea3673b 100644
>>> --- a/lib/utils/serial/fdt_serial_xlnx_uartlite.c
>>> +++ b/lib/utils/serial/fdt_serial_xlnx_uartlite.c
>>> @@ -15,7 +15,7 @@ static int serial_xlnx_uartlite_init(void *fdt, int nodeoff,
>>> 				const struct fdt_match *match)
>>> {
>>> 	int rc;
>>> -	struct platform_uart_data uart;
>>> +	struct platform_uart_data uart = { 0 };
>>> 
>>> 	rc = fdt_parse_xlnx_uartlite_node(fdt, nodeoff, &uart);
>>> 	if (rc)
>>> diff --git a/platform/fpga/openpiton/platform.c b/platform/fpga/openpiton/platform.c
>>> index 7ca21236bfef..5ff7d200aba9 100644
>>> --- a/platform/fpga/openpiton/platform.c
>>> +++ b/platform/fpga/openpiton/platform.c
>>> @@ -69,7 +69,7 @@ static struct aclint_mtimer_data mtimer = {
>>> static int openpiton_early_init(bool cold_boot)
>>> {
>>> 	void *fdt;
>>> -	struct platform_uart_data uart_data;
>>> +	struct platform_uart_data uart_data = { 0 };
>>> 	struct plic_data plic_data;
>>> 	unsigned long aclint_freq;
>>> 	uint64_t clint_addr;
>>> -- 
>>> 2.36.1
>>> 
>>> 
>>> -- 
>>> opensbi mailing list
>>> opensbi at lists.infradead.org
>>> http://lists.infradead.org/mailman/listinfo/opensbi
>> 


