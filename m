From: Petro Karashchenko <petro.karashchenko@gmail.com>
Date: Thu, 17 Feb 2022 23:31:39 +0200
Subject: riscv_encoding.h: double definition upon integration with other
 projects
Message-ID: <CAA5uK6JjGK2m-aRw-yi1KV9LkAay0BNisjyAxxfZp4uit9+-_Q@mail.gmail.com>
List-Id: <opensbi.lists.infradead.org>
To: opensbi@lists.infradead.org
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit

Hello,

Recently the opensbi support was added to Apache NuttX project. But
the integration didn't pass cleanly and currently require few
workarounds to eliminate dozens of warnings. The reason for this is
that internal NuttX header files have defines with the same names that
are available in
https://github.com/riscv-software-src/opensbi/blob/master/include/sbi/riscv_encoding.h

I want to ask the OpenSBI team for advice on what can be an optimal
solution for such types of issues? Can we add "#ifndef" wrapper for
defines in "riscv_encoding.h" so there will be no redefinition
warnings or add "OPENSBI_" prefix? Do you see this as a reasonable
solution?

Best regards,
Petro

