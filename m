From: Jessica Clarke <jrtc27@jrtc27.com>
Date: Thu, 8 Aug 2024 18:49:47 +0100
Subject: [PATCH v3 3/3] lib: sbi: Implement aligned memory allocators
In-Reply-To: <E0107FD0-2714-49A6-AE73-8578B17A451C@gmail.com>
References: <20240807181719.244099-1-gregorhaas1997@gmail.com>
 <20240807181719.244099-4-gregorhaas1997@gmail.com>
 <CAAhSdy07MJHrKLKhDE4L5Se3vhmaS2y9-PjEhA2=daGZoVL7mA@mail.gmail.com>
 <E0107FD0-2714-49A6-AE73-8578B17A451C@gmail.com>
Message-ID: <C2F8C425-5ABA-4642-8BDF-451E3D5A1105@jrtc27.com>
List-Id: <opensbi.lists.infradead.org>
To: opensbi@lists.infradead.org
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit

On 8 Aug 2024, at 18:47, Gregor Haas <gregorhaas1997@gmail.com> wrote:
> 
> Hi Anup,
> 
>> On Aug 7, 2024, at 10:33?PM, Anup Patel <anup@brainfault.org> wrote:
>> 
>> On Wed, Aug 7, 2024 at 11:47?PM Gregor Haas <gregorhaas1997@gmail.com> wrote:
>>> 
>>> This change adds a simple implementation of sbi_memalign(), for future use in
>>> allocating aligned memory for SMMTT tables.
>>> 
>>> Signed-off-by: Gregor Haas <gregorhaas1997@gmail.com>
>>> ---
>>> include/sbi/sbi_heap.h |  9 +++++
>>> lib/sbi/sbi_heap.c     | 81 ++++++++++++++++++++++++++++++++++++++----
>>> 2 files changed, 84 insertions(+), 6 deletions(-)
>>> 
>>> diff --git a/include/sbi/sbi_heap.h b/include/sbi/sbi_heap.h
>>> index 9a67090..2103aef 100644
>>> --- a/include/sbi/sbi_heap.h
>>> +++ b/include/sbi/sbi_heap.h
>>> @@ -31,6 +31,15 @@ static inline void *sbi_malloc(size_t size)
>>>       return sbi_malloc_from(&global_hpctrl, size);
>>> }
>>> 
>>> +/** Allocate aligned from heap area */
>>> +void *sbi_memalign_from(struct sbi_heap_control *hpctrl, size_t alignment,
>>> +                       size_t size);
>>> +
>>> +static inline void *sbi_memalign(size_t alignment, size_t size)
>>> +{
>>> +       return sbi_memalign_from(&global_hpctrl, alignment, size);
>>> +}
>> 
>> The term "memalign" does not imply it is a memory allocation function.
>> 
>> I suggest the following names instead:
>> sbi_malloc_aligned_from()
>> sbi_malloc_aligned()
> 
> I took this function prototype from POSIX?s memalign, which is a standard allocation
> function. I can definitely rename this, but thought I would give my justification.
> 
> For all other comments below, agreed ? I can integrate these changes. Do you want
> me to send a whole new v4 patch series (including the two earlier commits you?ve
> reviewed already)? Or send a new version of just this commit?

I would suggest instead trying to look like ISO C11?s aligned_alloc as
a broader standard function.

Jess


