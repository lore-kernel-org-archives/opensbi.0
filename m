From: Jan Remeš <jan.remes@codasip.com>
Date: Thu, 26 May 2022 16:31:07 +0200
Subject: [PATCH v2] lib: sbi: Improve csr read and write
In-Reply-To: <20220526141809.303161-1-wxjstz@126.com>
References: <20220526141809.303161-1-wxjstz@126.com>
Message-ID: <CALXH3=Jyvtb+-kEMnjhhZB0=wmQi8zqm7=wXprkSWKWZmrt8Lg@mail.gmail.com>
List-Id: <opensbi.lists.infradead.org>
To: opensbi@lists.infradead.org
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit

On Thu, May 26, 2022 at 4:19 PM Xiang W <wxjstz@126.com> wrote:
>
> +       uint32_t opcode_buff[2];
> +       typedef unsigned long (*read_f)(void);
> +       opcode_buff[0] = (csr_num << 20) | 0x00002573; /* csrr a0, csr */
> +       opcode_buff[1] = 0x00008067; /* ret */
> +       return ((read_f)opcode_buff)();
I am not completely sure here, but doesn't this need a FENCE.I before
the opcode is executed?

Best regards,
  Jan

