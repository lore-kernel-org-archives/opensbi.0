From: Abner Chang <abner.chang@hpe.com>
Date: Thu, 23 Jul 2020 09:54:01 +0800
Subject: [PATCH 0/3] Use standard C string APIs in FDT helper
Message-ID: <20200723015404.17667-1-abner.chang@hpe.com>
List-Id: <opensbi.lists.infradead.org>
To: opensbi@lists.infradead.org
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit

Use strncmp instead of using sbi_strcmp directly in fdthelp.c.
- This keeps the consistency with lidfdt implementation and utilizing
  libfdt_evn.h for the different build environment even fdlhelp.c is not
  part of standard fdt library.
- In libfdt_evn.h, a macro overrides strncmp with sbi_strncmp.
- For edk2 firmware solution, similar macro is used to repalce strncmp with
  EDK2 string API.
- Use strncmp instead of strcmp, which is much safer.

Abner Chang (3):
  Use standard C string APIs in FDT helper
  Use standard C string APIs in FDT helper
  Use standard C string APIs in FDT helper

 include/sbi/sbi_string.h      | 2 +-
 lib/sbi/sbi_string.c          | 4 ++--
 lib/utils/fdt/fdt_helper.c    | 2 +-
 lib/utils/libfdt/libfdt_env.h | 2 +-
 4 files changed, 5 insertions(+), 5 deletions(-)

-- 
2.25.0


