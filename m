From: Bin Meng <bmeng.cn@gmail.com>
Date: Thu, 4 Nov 2021 10:02:25 +0800
Subject: [PATCH v3 01/11] riscv: Add new CSRs introduced by Sscofpmf
 extension
In-Reply-To: <20211102150959.492991-2-atish.patra@wdc.com>
References: <20211102150959.492991-1-atish.patra@wdc.com>
 <20211102150959.492991-2-atish.patra@wdc.com>
Message-ID: <CAEUhbmX8PqFpT4rR-W4dVjqbQhgm6RzU+uPmOG-0wBY6yKbVFw@mail.gmail.com>
List-Id: <opensbi.lists.infradead.org>
To: opensbi@lists.infradead.org
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit

On Tue, Nov 2, 2021 at 11:11 PM Atish Patra <atish.patra@wdc.com> wrote:
>

It would be good to put the Sscovpmf spec link in the commit message,
so that people know where to find the spec, (at the time being).

> Signed-off-by: Atish Patra <atish.patra@wdc.com>
> ---
>  include/sbi/riscv_encoding.h | 34 ++++++++++++++++++++++++++++++++++
>  1 file changed, 34 insertions(+)
>

Reviewed-by: Bin Meng <bmeng.cn@gmail.com>

