From: Ivan Orlov <ivan.orlov0322@gmail.com>
Date: Tue, 5 Mar 2024 13:27:55 +0000
Subject: [PATCH v4 1/4] docs: Add documentation about tests and SBIUnit
In-Reply-To: <20240305-b059f717f9efb7f50844a891@orel>
References: <20240304214551.365057-1-ivan.orlov0322@gmail.com>
 <20240304214551.365057-2-ivan.orlov0322@gmail.com>
 <20240305-b059f717f9efb7f50844a891@orel>
Message-ID: <76a18f42-35d3-485c-8971-175c55ef5da4@gmail.com>
List-Id: <opensbi.lists.infradead.org>
To: opensbi@lists.infradead.org
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit

On 3/5/24 12:20, Andrew Jones wrote:
> On Mon, Mar 04, 2024 at 09:45:48PM +0000, Ivan Orlov wrote:
>> This patch contains the documentation for SBIUnit. It describes:
>>
>> - What is SBIUnit
>> - Simple test writing scenario
>> - How we can cover static functions
>> - How we can "mock" structures in order to test the functions which
>> operate on them
>> - SBIUnit API Reference
>>
>> Signed-off-by: Ivan Orlov <ivan.orlov0322@gmail.com>
> 
> I already gave an r-b on this patch. The changelog doesn't say anything,
> other than what I pointed out, has changed, so I won't review it again. If
> more changes were made that kept you from adding my r-b, then please
> point those out. Otherwise here it is again,
> 
> Reviewed-by: Andrew Jones <ajones@ventanamicro.com>
> 

Hi Andrew,

Thank you for the review and sorry, I thought the "Reviewed-by" tag is 
only inherited when no changes at all were made since the previous version.

The only change for this particular patch is the fix of "the" articles 
in the text, which you've pointed out in the previous version.
-- 
Kind regards,
Ivan Orlov


