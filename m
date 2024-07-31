From: Leo Liang <ycliang@andestech.com>
Date: Wed, 31 Jul 2024 11:34:59 +0800
Subject: [PATCH v2, 1/1] util: atcsmu.c: fix typo and coding style
In-Reply-To: <1F272D04-075C-4AF0-9FC4-623551D72575@jrtc27.com>
References: <20240731025841.984979-1-ycliang@andestech.com>
 <1F272D04-075C-4AF0-9FC4-623551D72575@jrtc27.com>
Message-ID: <Zqmw4ynJ38mJOFj4@swlinux02>
List-Id: <opensbi.lists.infradead.org>
To: opensbi@lists.infradead.org
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit

On Wed, Jul 31, 2024 at 04:24:42AM +0100, Jessica Clarke wrote:
> [EXTERNAL MAIL]
> 
> On 31 Jul 2024, at 03:58, Leo Yu-Chi Liang <ycliang@andestech.com> wrote:
> >
> > Fix typo "hard -> hart", printf format and if statement coding style.
> >
> > Signed-off-by: Leo Yu-Chi Liang <ycliang@andestech.com>
> > Reviewed-by: Yu Chien Peter Lin <peterlin@andestech.com>
> 
> 1. Don?t combine changes like this, it makes it hard to see what?s just
> a style change and what?s a behavioural change.
> 
> 2. Early return is often better code like in these cases, but it?s not
> like the existing code is wrong style-wise or hard to read.
> 
> Jess

Hi Jess,

Thanks for the review.
I will split these changes into two patches, 
modify the wording of the commit messages and send a v3 patch ASAP.

Best regards,
Leo

