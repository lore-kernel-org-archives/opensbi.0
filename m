From: Yu-Chien Peter Lin <peterlin@andestech.com>
Date: Sun, 19 Feb 2023 17:44:19 +0000
Subject: [PATCH] lib: utils: fdt_fixup: Fix compile error
In-Reply-To: <874jrij9zm.fsf@linux-m68k.org>
References: <20230219063335.30952-1-peterlin@andestech.com>
 <874jrij9zm.fsf@linux-m68k.org>
Message-ID: <Y/Jf2w3TaEfRiMlz@APC323>
List-Id: <opensbi.lists.infradead.org>
To: opensbi@lists.infradead.org
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit

On Sun, Feb 19, 2023 at 10:11:09AM +0100, Andreas Schwab wrote:
> On Feb 19 2023, Yu Chien Peter Lin wrote:
> 
> > Thus move the label "next_entry" to the beginning of the for loop.
> 
> This changes the semantics, because jumping to the top of the loop skips
> the update expression.
> 
> -- 
> Andreas Schwab, schwab at linux-m68k.org
> GPG Key fingerprint = 7578 EB47 D4E5 4D69 2510  2552 DF73 E780 A9DA AEC1
> "And now for something completely different."

Hi Andreas,

Thanks for pointing this out!

Hi Xiang,

I've set the patch state to superseded,
Could you send your fix?

Thanks
Peter Lin

