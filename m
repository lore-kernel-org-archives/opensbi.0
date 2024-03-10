From: Ivan Orlov <ivan.orlov0322@gmail.com>
Date: Sun, 10 Mar 2024 20:17:35 +0000
Subject: [PATCH v4 3/4] lib: tests: Add a test for sbi_bitmap
In-Reply-To: <CAAhSdy20aPRNTknw9QjCRH5x7His7em-Ga5FKKDc4J1byTJSSA@mail.gmail.com>
References: <20240304214551.365057-1-ivan.orlov0322@gmail.com>
 <20240304214551.365057-4-ivan.orlov0322@gmail.com>
 <CAAhSdy20aPRNTknw9QjCRH5x7His7em-Ga5FKKDc4J1byTJSSA@mail.gmail.com>
Message-ID: <f308f71f-9ea2-4393-b54b-d696053f91c3@gmail.com>
List-Id: <opensbi.lists.infradead.org>
To: opensbi@lists.infradead.org
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit

On 3/10/24 04:50, Anup Patel wrote:
> On Tue, Mar 5, 2024 at 3:15?AM Ivan Orlov <ivan.orlov0322@gmail.com> wrote:
>>
>> Add test suite covering all of the functions from lib/sbi/sbi_bitmap.c:
>> __bitmap_and, __bitmap_or and __bitmap_xor.
>>
>> Signed-off-by: Ivan Orlov <ivan.orlov0322@gmail.com>
>> Reviewed-by: Andrew Jones <ajones@ventanamicro.com>
> 
> This sbi_bitmap_test.c fails to compile for RV32 due the "u64"
> variables. I have fixed this at the time of merging this patch.
> 
> Applied this patch to the riscv/opensb repo.
> 

Thank you for fixing this error, I'll try to set up the proper test 
tooling/infrastructure to avoid such mistakes in the future.

Actually, I was thinking about a python script for the test automation, 
similar to what we have in the Linux Kernel for KUnit. For instance, it 
could run the tests for the multiple XLENs and extension sets and report 
results in a nice format.

-- 
Kind regards,
Ivan Orlov


