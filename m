From: Andrew Jones <ajones@ventanamicro.com>
Date: Wed, 28 Feb 2024 15:28:42 +0100
Subject: [PATCH v2 4/5] lib: tests: Add a test for sbi_bitmap
In-Reply-To: <20240215161625.314131-5-ivan.orlov0322@gmail.com>
References: <20240215161625.314131-1-ivan.orlov0322@gmail.com>
 <20240215161625.314131-5-ivan.orlov0322@gmail.com>
Message-ID: <20240228-171d01c049bbf1e5f64b3174@orel>
List-Id: <opensbi.lists.infradead.org>
To: opensbi@lists.infradead.org
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit

On Thu, Feb 15, 2024 at 04:16:24PM +0000, Ivan Orlov wrote:
> Add test suite covering all of the functions from lib/sbi/sbi_bitmap.c:
> __bitmap_and, __bitmap_or and __bitmap_xor.
> 
> Signed-off-by: Ivan Orlov <ivan.orlov0322@gmail.com>
> ---
> V1 -> V2:
> - Extract the part of the commit description to the cover letter
> - Update to use the carray functionality instead of placing the pointer
> to the test suite directly into the sources
> - Fix codestyle issues
> - Use the references to the data_* arrays when defining the expected
> test results, instead of repeating the same numbers again and again
> 
>  lib/sbi/objects.mk        |   3 ++
>  lib/sbi/sbi_bitmap_test.c | 103 ++++++++++++++++++++++++++++++++++++++
>  2 files changed, 106 insertions(+)
>  create mode 100644 lib/sbi/sbi_bitmap_test.c
>

Reviewed-by: Andrew Jones <ajones@ventanamicro.com>

