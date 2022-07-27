From: Jessica Clarke <jrtc27@jrtc27.com>
Date: Wed, 27 Jul 2022 15:53:37 +0100
Subject: [PATCH] lib: sbi: Fix printf handling of long long
In-Reply-To: <AF7FE4B0-2DBE-4827-AC1C-05E6709784C5@jrtc27.com>
References: <TYYP286MB1439FD2B8C624B5346185D7DC6979@TYYP286MB1439.JPNP286.PROD.OUTLOOK.COM>
 <20220727143254.kb7nrdccubbdzsxe@kamzik>
 <AF7FE4B0-2DBE-4827-AC1C-05E6709784C5@jrtc27.com>
Message-ID: <6F9758F7-03BC-4703-BFBE-B70601785B92@jrtc27.com>
List-Id: <opensbi.lists.infradead.org>
To: opensbi@lists.infradead.org
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit

On 27 Jul 2022, at 15:48, Jessica Clarke <jrtc27@jrtc27.com> wrote:
> 
> On 27 Jul 2022, at 15:32, Andrew Jones <ajones@ventanamicro.com> wrote:
>> 
>> On Wed, Jul 27, 2022 at 10:07:39PM +0800, dramforever wrote:
>>> Do not attempt to unnecessarily align va_list before reading long long
>>> arguments.
>> 
>> Can you please elaborate on why it was presumed necessary once, but is now
>> deemed not necessary?
> 
> Because of this nonsense that follows:
> 
> 	if (sizeof(unsigned long long) ==
> 			sizeof(unsigned long)) {
> 		tmp = va_arg(args, unsigned long long);
> 		acnt += sizeof(unsigned long long);
> 	} else {
> 		((unsigned long *)&tmp)[0] =
> 			va_arg(args, unsigned long);
> 		((unsigned long *)&tmp)[1] =
> 			va_arg(args, unsigned long);
> 		acnt += 2*sizeof(unsigned long);
> 	}
> 
> For RV64 the condition of the while is always false as variadic
> arguments are already padded to 8 bytes.

Uh I forgot to snip this sentence after my understanding evolved. This
is false and contradicted by what I say later.

> For RV32 the implementation of
> va_arg will dynamically align the pointer to 8 bytes at run time
> (mirroring what this loop does) so it would seem unnecessary, except
> for the nonsense that follows. Since unsigned long is only 32-bit, it
> ends up taking the else branch and reading two unsigned longs, which
> will *not* get the same dynamic alignment from the compiler. So long as
> that nonsense also exists the code is needed on RV32. Where this gets
> more problematic, though, is on RV64, since acnt does not stay in sync
> with how much args has been offset; all variadic arguments are padded
> to 8 bytes, but for (unsigned) int the printf implementation here only
> increments acnt by sizeof(int). Thus, on RV64, if you pass an odd
> number of ints and then a long long the implementation will erroneously
> skip an entry, which is presumably what resulted in this being found
> and the patch in question.
> 
> This should all be changed to just reading an unsigned long long
> because that will do the right thing (if not that is a serious compiler
> bug), not try to buggily reimplement va_arg ABI lowering.
> 
> Note this code has existed right from 9e8ff05cb61f ("Initial commit.?).
> 
> Jess
> 
>>> Signed-off-by: dramforever <dramforever@live.com>
>>> ---
>>> lib/sbi/sbi_console.c | 5 -----
>>> 1 file changed, 5 deletions(-)
>>> 
>>> diff --git a/lib/sbi/sbi_console.c b/lib/sbi/sbi_console.c
>>> index 34c843d..7af50e5 100644
>>> --- a/lib/sbi/sbi_console.c
>>> +++ b/lib/sbi/sbi_console.c
>>> @@ -261,11 +261,6 @@ static int print(char **out, u32 *out_len, const char *format, va_list args)
>>> 				continue;
>>> 			}
>>> 			if (*format == 'l' && *(format + 1) == 'l') {
>>> -				while (acnt &
>>> -				 (sizeof(unsigned long long) - 1)) {
>>> -					va_arg(args, int);
>>> -					acnt += sizeof(int);
>>> -				}
>> 
>> I think this should generate a "set but not used" warning with clang, as
>> this was the only place acnt was getting used. We can just remove all of
>> it.
>> 
>> Thanks,
>> drew
>> 
>>> 				if (sizeof(unsigned long long) ==
>>> 				 sizeof(unsigned long)) {
>>> 					tmp = va_arg(args, unsigned long long);
>>> -- 
>>> 2.37.0
>>> 
>>> 
>>> -- 
>>> opensbi mailing list
>>> opensbi at lists.infradead.org
>>> http://lists.infradead.org/mailman/listinfo/opensbi
>> 
>> -- 
>> opensbi mailing list
>> opensbi at lists.infradead.org
>> http://lists.infradead.org/mailman/listinfo/opensbi
> 


