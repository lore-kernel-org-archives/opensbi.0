From: Andreas Schwab <schwab@linux-m68k.org>
Date: Sun, 11 Dec 2022 11:52:33 +0100
Subject: [PATCH v3 1/5] lib: utils/irqchip: plic: Fix the off-by-one
 error in priority save/restore helpers
In-Reply-To: <CAEUhbmWJCB=i7OkeCMvtz0ut9xcCjiO8fTQ379GZWU=vHuzhwg@mail.gmail.com>
	(Bin Meng's message of "Sun, 11 Dec 2022 18:18:07 +0800")
References: <20221211065424.806478-1-bmeng@tinylab.org>
	<87a63ufe4a.fsf@linux-m68k.org>
	<CAEUhbmWJCB=i7OkeCMvtz0ut9xcCjiO8fTQ379GZWU=vHuzhwg@mail.gmail.com>
Message-ID: <875yeifc0e.fsf@linux-m68k.org>
List-Id: <opensbi.lists.infradead.org>
To: opensbi@lists.infradead.org
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit

On Dez 11 2022, Bin Meng wrote:

> On Sun, Dec 11, 2022 at 6:08 PM Andreas Schwab <schwab@linux-m68k.org> wrote:
>>
>> On Dez 11 2022, Bin Meng wrote:
>>
>> > diff --git a/lib/utils/irqchip/plic.c b/lib/utils/irqchip/plic.c
>> > index 73d7788..4df9020 100644
>> > --- a/lib/utils/irqchip/plic.c
>> > +++ b/lib/utils/irqchip/plic.c
>> > @@ -38,13 +38,13 @@ static void plic_set_priority(const struct plic_data *plic, u32 source, u32 val)
>> >
>> >  void plic_priority_save(const struct plic_data *plic, u8 *priority)
>> >  {
>> > -     for (u32 i = 0; i < plic->num_src; i++)
>> > +     for (u32 i = 1; i <= plic->num_src; i++)
>> >               priority[i] = plic_get_priority(plic, i);
>>
>> That needs to adjust the index into the priority array.
>
> Does that help anything?

Yes, it fixes an off-by-one error.

-- 
Andreas Schwab, schwab at linux-m68k.org
GPG Key fingerprint = 7578 EB47 D4E5 4D69 2510  2552 DF73 E780 A9DA AEC1
"And now for something completely different."

