From: Jessica Clarke <jrtc27@jrtc27.com>
Date: Wed, 14 Sep 2022 13:15:59 +0100
Subject: [PATCH 1/1] docs/firmware: Update FW_JUMP documentation
In-Reply-To: <20220914101120.qyrdh62bji3zogpv@kamzik>
References: <20220913054605.19929-1-nylon.chen@sifive.com>
 <20220914101120.qyrdh62bji3zogpv@kamzik>
Message-ID: <62FCA567-8009-4B9A-B037-F8DEF9B3AADD@jrtc27.com>
List-Id: <opensbi.lists.infradead.org>
To: opensbi@lists.infradead.org
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit

On 14 Sept 2022, at 11:11, Andrew Jones <ajones@ventanamicro.com> wrote:
> 
> On Tue, Sep 13, 2022 at 01:46:05PM +0800, Nylon Chen wrote:
>> From: "Nylon.Chen" <nylon.chen@sifive.com>
>> 
>> Add a tip for OpenSBI's Jump mode.
>> 
>> help user avoids the kernel overwritten.
>> 
>> Signed-off-by: Nylon Chen <nylon.chen@sifive.com>
>> Signed-off-by: Nylon.Chen <nylon.chen@sifive.com>
>> ---
>> docs/firmware/fw_jump.md | 18 ++++++++++++++++++
>> 1 file changed, 18 insertions(+)
>> 
>> diff --git a/docs/firmware/fw_jump.md b/docs/firmware/fw_jump.md
>> index 35a4301..c20d722 100644
>> --- a/docs/firmware/fw_jump.md
>> +++ b/docs/firmware/fw_jump.md
>> @@ -40,6 +40,24 @@ follows:
>> the booting stage following the OpenSBI firmware. If this option is not
>> provided, then the OpenSBI firmware will pass the FDT address passed by the
>> previous booting stage to the next booting stage.
>> + 
>> + If your *PLATFORM=generic* and your *FW_JUMP_FDT_ADDR* is default, you must check
>> + your Linux size because Linux will be overwritten in OpneSBI's FDT copy loop.
>> + You can use the following method.
> 
> Ensure FW_JUMP_FDT_ADDR is set high enough to avoid overwriting the
> kernel. The following method may be used to check if the default
> (0x2200000) is sufficient:
> 
>> +
>> + ```
>> + LAST_SECTION=`${CROSS_COMPILE}objdump -h vmlinux | grep "00*" | awk '{print $5,$3}'\
>> + | sort -rfu | head -n 1 | awk '{split($0,addr," ");print addr[1]}'` \
>> + && LAST_SECTION_SIZE=`${CROSS_COMPILE}objdump -h vmlinux | grep "00*" |awk '{print $5,$3}'\
>> + | sort -rfu | head -n 1 | awk '{split($0,addr,"")}'` \
>> + && OFFSET_ADDR=$(( 16#$LAST_SECTION_SIZE + 16#$LAST_SECTION)) \
>> + && printf "The LMA of the last section of the Kernel is 0x%X\n" ${OFFSET_ADDR}
>> + ```
> 
> Once we've decided to use awk, we might as well use all of it
> 
> ${CROSS_COMPILE}objdump -h $KERNEL_ELF | sort -k 5,5 |
> awk '/^ +[0-9]+ / \
> { s = strtonum("0x"$3) + strtonum("0x"$5) } \
> END { \
> if (s > 0x2200000) { \
> print "fdt overlaps kernel, increase FW_JUMP_FDT_ADDR"; \
> exit(1) \
> } \
> }'

strtonum is a GNU awk extension that isn?t in One True Awk as used by
FreeBSD and macOS.

Jess

> Thanks,
> drew
> 
>> + 
>> + If the result is bigger than the default of FW_JUMP_FDT_ADDR(0x2200000), 
>> + you must change it to avoid the problem of being overwritten.
>> +
>> +
>> 
>> *FW_JUMP* Example
>> -----------------
>> -- 
>> 2.36.1
>> 
>> 
>> -- 
>> opensbi mailing list
>> opensbi at lists.infradead.org
>> http://lists.infradead.org/mailman/listinfo/opensbi
> 
> -- 
> opensbi mailing list
> opensbi at lists.infradead.org
> http://lists.infradead.org/mailman/listinfo/opensbi


