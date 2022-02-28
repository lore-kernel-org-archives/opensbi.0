From: Atish Kumar Patra <atishp@rivosinc.com>
Date: Mon, 28 Feb 2022 00:56:43 -0800
Subject: [PATCH v1 0/2] Sstc extension support
In-Reply-To: <20220228082604.3649231-1-atishp@rivosinc.com>
References: <20220228082604.3649231-1-atishp@rivosinc.com>
Message-ID: <CAHBxVyH=ByeK6c8XdCWjzOjrXr9LMWGg6_TG5xLp-e-CBWzAKw@mail.gmail.com>
List-Id: <opensbi.lists.infradead.org>
To: opensbi@lists.infradead.org
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit

On Mon, Feb 28, 2022 at 12:26 AM Atish Patra <atishp@rivosinc.com> wrote:
>
> This series adds support for Sstc extension which was ratified recently.
> The PATCH 1 adds menvcfg CSR while the PATCH 2 actually adds the Sstc
> specific details.
>
> Atish Patra (2):
> lib/sbi: Implement menvcfg CSR
> lib: sbi: Implement Sstc extension
>
> include/sbi/riscv_encoding.h | 15 +++++++++++++++
> include/sbi/sbi_hart.h       |  6 +++++-
> lib/sbi/sbi_hart.c           | 33 +++++++++++++++++++++++++++++++++
> lib/sbi/sbi_timer.c          | 25 ++++++++++++++++++++++---
> 4 files changed, 75 insertions(+), 4 deletions(-)
>
> --
> 2.30.2
>

Please ignore this email. It had Anup's old WDC email address. I
stopped the git send-email midway. But I was too slow for it :).
I resent it with the correct email address. Sorry for the noise.

