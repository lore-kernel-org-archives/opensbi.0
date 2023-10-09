From: Inochi Amaoto <inochiama@outlook.com>
Date: Mon,  9 Oct 2023 08:19:06 +0800
Subject: [PATCH v2 2/4] lib: utils/ipi: mswi: add separate T-Head C9xx CLINT mswi compatible
In-Reply-To: <1e9653aa-d618-4ea8-b6e0-c0f458822e50@sifive.com>
References: <1e9653aa-d618-4ea8-b6e0-c0f458822e50@sifive.com>
Message-ID: <IA1PR20MB49531F8F9DB5B02BAA3ADA80BBCEA@IA1PR20MB4953.namprd20.prod.outlook.com>
List-Id: <opensbi.lists.infradead.org>
To: opensbi@lists.infradead.org
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit

>On 2023-10-08 7:16 AM, Inochi Amaoto wrote:
>> Like the mtimer of T-HEAD C9xx clint, the mswi also needs new compatible
>> string to avoid misuse.
>>
>> Signed-off-by: Inochi Amaoto <inochiama@outlook.com>
>> Link: https://lore.kernel.org/linux-riscv/1f6b82a1864477a51db33d3f295889ff985b497b.1696433229.git.unicorn_wang at outlook.com/
>> ---
>>  lib/utils/ipi/fdt_ipi_mswi.c | 1 +
>>  1 file changed, 1 insertion(+)
>>
>> diff --git a/lib/utils/ipi/fdt_ipi_mswi.c b/lib/utils/ipi/fdt_ipi_mswi.c
>> index e3a6378..f4b2de4 100644
>> --- a/lib/utils/ipi/fdt_ipi_mswi.c
>> +++ b/lib/utils/ipi/fdt_ipi_mswi.c
>> @@ -56,6 +56,7 @@ static const struct fdt_match ipi_mswi_match[] = {
>>  	{ .compatible = "riscv,clint0", .data = &clint_offset },
>>  	{ .compatible = "sifive,clint0", .data = &clint_offset },
>>  	{ .compatible = "thead,c900-clint", .data = &clint_offset },
>> +	{ .compatible = "thead,c900-aclint-mswi", .data = &clint_offset },
>
>This should omit .data, like for riscv,aclint-mswi below, so it gets the MMIO
>region base and size directly from the DT node.
>
>Regards,
>Samuel
>

Yes, I will omit it. It seems I have misunderstand the aclint.

>>  	{ .compatible = "riscv,aclint-mswi" },
>>  	{ },
>>  };
>

