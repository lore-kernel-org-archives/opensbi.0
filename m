From: Abner Chang <abner.chang@hpe.com>
Date: Sat, 25 Jul 2020 17:30:38 +0800
Subject: [PATCH v2 0/3] Use standard C string APIs in FDT helper
Message-ID: <20200725093041.7373-1-abner.chang@hpe.com>
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
- Still keep sbi_strcmp() for the completeness of supporting string functions.

Abner Chang (3):
  Use standard C string APIs in FDT helper
  Use standard C string APIs in FDT helper
  Use standard C string APIs in FDT helper

 include/sbi/sbi_string.h      |  7 +++++++
 lib/sbi/sbi_string.c          | 13 +++++++++++++
 lib/utils/fdt/fdt_helper.c    |  2 +-
 lib/utils/libfdt/libfdt_env.h |  1 +
 4 files changed, 22 insertions(+), 1 deletion(-)

-- 
2.25.0


