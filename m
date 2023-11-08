From: Bo Gan <ganboing@gmail.com>
Date: Wed, 8 Nov 2023 02:26:14 -0800
Subject: [PATCH] lib: sbi: Remove xchg/cmpxchg implemented via lr/sc
In-Reply-To: <0569501d1669fee1dfcceae0fb456c76b13c0b80.camel@126.com>
References: <20231108032859.159198-1-wxjstz@126.com>
 <d50c455f-fb4c-4e63-c256-61af74cf8c9b@gmail.com>
 <0569501d1669fee1dfcceae0fb456c76b13c0b80.camel@126.com>
Message-ID: <f21d8661-43c5-55c5-b887-c20931f8e839@gmail.com>
List-Id: <opensbi.lists.infradead.org>
To: opensbi@lists.infradead.org
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit

On 11/8/23 1:26 AM, Xiang W wrote:
> Thanks for the feedback.
> 
> I'm a bit confused: doesn't your example prove that lr/sc doesn't work on a specific platform?
> Why do you advise keeping?
> 
> Regards,
> Xiang W

I have no preference on whether it should be removed. If there's no objection, go ahead.
If other people find it might be useful and against the removal, then I'd prefer lr/sc to
be made optional, and by default use amo.

