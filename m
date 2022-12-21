From: Bin Meng <bmeng@tinylab.org>
Date: Wed, 21 Dec 2022 15:31:44 +0000
Subject: [PATCH] treewide: Replace TRUE/FALSE with true/false
In-Reply-To: <b8716804-8e2b-cbd3-c6b9-74d1529e92e7@codethink.co.uk>
References: <20221221113806.1450323-1-bmeng@tinylab.org>
 <b8716804-8e2b-cbd3-c6b9-74d1529e92e7@codethink.co.uk>
Message-ID: <em0d571ad2-e509-497e-a061-623da606451c@a9022134.com>
List-Id: <opensbi.lists.infradead.org>
To: opensbi@lists.infradead.org
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit

On 2022/12/21 23:05:07, "Ben Dooks" <ben.dooks@codethink.co.uk> wrote:

>On 21/12/2022 11:38, Bin Meng wrote:
>>C language standard uses true/false for the boolean type.
>>Let's switch to that for better language compatibility.
>>
>>Signed-off-by: Bin Meng <bmeng@tinylab.org>
>
>snip
>
>>diff --git a/include/sbi/sbi_types.h b/include/sbi/sbi_types.h
>>index 7fb1af7..75cdddd 100644
>>--- a/include/sbi/sbi_types.h
>>+++ b/include/sbi/sbi_types.h
>>@@ -54,10 +54,8 @@ typedef unsigned long		virtual_size_t;
>>   typedef unsigned long		physical_addr_t;
>>   typedef unsigned long		physical_size_t;
>>   -#define TRUE			1
>>-#define FALSE			0
>>-#define true			TRUE
>>-#define false			FALSE
>>+#define true			1
>>+#define false			0
>>
>
>I assume we can't use the <stdbool.h> ?
>

Yes, as we are using -nostdinc and -nostdlib.

Regards,
Bin

