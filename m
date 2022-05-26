From: Xiang W <wxjstz@126.com>
Date: Thu, 26 May 2022 22:37:40 +0800
Subject: [PATCH v2] lib: sbi: Improve csr read and write
In-Reply-To: <CALXH3=Jyvtb+-kEMnjhhZB0=wmQi8zqm7=wXprkSWKWZmrt8Lg@mail.gmail.com>
References: <20220526141809.303161-1-wxjstz@126.com>
	 <CALXH3=Jyvtb+-kEMnjhhZB0=wmQi8zqm7=wXprkSWKWZmrt8Lg@mail.gmail.com>
Message-ID: <4a3296ab01fe55cbd7c7bb7a412184752dfd1fd9.camel@126.com>
List-Id: <opensbi.lists.infradead.org>
To: opensbi@lists.infradead.org
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit

? 2022-05-26???? 16:31 +0200?Jan Reme????
> On Thu, May 26, 2022 at 4:19 PM Xiang W <wxjstz@126.com> wrote:
> > 
> > +?????? uint32_t opcode_buff[2];
> > +?????? typedef unsigned long (*read_f)(void);
> > +?????? opcode_buff[0] = (csr_num << 20) | 0x00002573; /* csrr a0, csr */
> > +?????? opcode_buff[1] = 0x00008067; /* ret */
> > +?????? return ((read_f)opcode_buff)();
> I am not completely sure here, but doesn't this need a FENCE.I before
> the opcode is executed?
Yes, fence.i is need. 

Thx
 Xiang W
> 
> Best regards,
> ? Jan



