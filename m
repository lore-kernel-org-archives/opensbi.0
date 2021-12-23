From: Heinrich Schuchardt <heinrich.schuchardt@canonical.com>
Date: Thu, 23 Dec 2021 19:44:15 +0100
Subject: [PATCH 1/1] lib: define memmove(), memcmp() as aliases
In-Reply-To: <CAAhSdy2uxkRTkwgMRDBu6kUYcjbRr=4QKiTGiQ7aivXM8oe+UA@mail.gmail.com>
References: <20211223110908.9580-1-heinrich.schuchardt@canonical.com>
 <CAAhSdy2uxkRTkwgMRDBu6kUYcjbRr=4QKiTGiQ7aivXM8oe+UA@mail.gmail.com>
Message-ID: <1d3a281f-646d-e568-3bab-65d6caa83da0@canonical.com>
List-Id: <opensbi.lists.infradead.org>
To: opensbi@lists.infradead.org
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit



On 12/23/21 12:52, Anup Patel wrote:
> Hi Heinrich,
> 
> On Thu, Dec 23, 2021 at 4:39 PM Heinrich Schuchardt
> <heinrich.schuchardt@canonical.com> wrote:
>>
>> According to the GCC documentation the freestanding environment must provide
>> memcpy(), memmove(), memset(), and memcmp(). We already have defined
>> memcpy() and memset() as weak aliases for sbi_memcpy() and sbi_memset() in
>> commit d249d6544c3c ("lib: sbi: Fix compile errors using -Os option").
>> Do the same for memmove() and memcmp().
>>
>> Signed-off-by: Heinrich Schuchardt <heinrich.schuchardt@canonical.com>
> 
> We are moving memcpy() and memset() aliases to fw_base.S so that
> it's not part of libsbi.a which in-turn helps external firmwares using
> OpenSBI as a library. I am not fond of this solution but for the time
> being it will work. After OpenSBI v1.0 release, we can figure-out
> better way to do this within the firmware/ directory.
> 
> Are you okay if I add memmove() and memcmp() aliases in
> fw_base.S as part of another patch ?

As you are anyway reworking the freestanding code, it makes sense that 
you consider all relevant functions at once. Thanks.

Best regards

Heinrich

> 
> Regards,
> Anup
> 
>> ---
>>   lib/sbi/sbi_string.c | 6 ++++++
>>   1 file changed, 6 insertions(+)
>>
>> diff --git a/lib/sbi/sbi_string.c b/lib/sbi/sbi_string.c
>> index c67c02e..233be4e 100644
>> --- a/lib/sbi/sbi_string.c
>> +++ b/lib/sbi/sbi_string.c
>> @@ -167,6 +167,9 @@ void *sbi_memmove(void *dest, const void *src, size_t count)
>>          return dest;
>>   }
>>
>> +void *memmove(void *dest, const void *src, size_t count) \
>> +__attribute__((weak, alias("sbi_memmove")));
>> +
>>   int sbi_memcmp(const void *s1, const void *s2, size_t count)
>>   {
>>          const char *temp1 = s1;
>> @@ -183,6 +186,9 @@ int sbi_memcmp(const void *s1, const void *s2, size_t count)
>>                  return 0;
>>   }
>>
>> +int memcmp(const void *s1, const void *s2, size_t count) \
>> +__attribute__((weak, alias("sbi_memcmp")));
>> +
>>   void *sbi_memchr(const void *s, int c, size_t count)
>>   {
>>          const unsigned char *temp = s;
>> --
>> 2.33.1
>>

