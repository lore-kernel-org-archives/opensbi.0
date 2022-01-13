From: Jessica Clarke <jrtc27@jrtc27.com>
Date: Thu, 13 Jan 2022 11:40:41 +0000
Subject: [PATCH v2] lib: fix pointer of type 'void *' used in arithmetic
In-Reply-To: <34228bc1-5083-fee8-8cce-be52f9d9a9a1@opensource.wdc.com>
References: <20220113084744.70982-1-jukkax@ssrc.tii.ae>
 <34228bc1-5083-fee8-8cce-be52f9d9a9a1@opensource.wdc.com>
Message-ID: <C1452FFE-D416-4ACC-8244-6A2BF2F0DD2B@jrtc27.com>
List-Id: <opensbi.lists.infradead.org>
To: opensbi@lists.infradead.org
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit

On 13 Jan 2022, at 10:52, Damien Le Moal <damien.lemoal@opensource.wdc.com> wrote:
> 
> [Re-sending this since my emails end up being empty...]
> 
> On 2022/01/13 17:49, Jukka Laitinen wrote:
>> Using "void *" in arithmetic causes errors with strict compiler settings:
>> "error: pointer of type 'void *' used in arithmetic [-Werror=pointer-arith]"
>> 
>> Just remove these by calculating on "char *" where 1-byte data size is assumed
> 
> s/Just Remove/Avoid
> (and nit: add a period at the end of the sentence)
> 
> I would also suggest a cast to unsigned long instead of char *. unsigned long is
> more common/natural for addresses arithmetic.

No it is not. unsigned long is not a pointer, we are not the Linux
kernel, do not introduce that nonsense to OpenSBI. Use char * or
uintptr_t.

Jess


