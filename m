From: Andrew Jones <ajones@ventanamicro.com>
Date: Tue, 13 Feb 2024 15:00:37 +0100
Subject: [PATCH 2/4] lib: Add SBIUnit testing macros and functions
In-Reply-To: <5be9d29f-08d8-40fe-adf0-7ced03303705@gmail.com>
References: <20240208095050.398522-1-ivan.orlov0322@gmail.com>
 <20240208095050.398522-2-ivan.orlov0322@gmail.com>
 <20240212-5d311c79e606a9d510631934@orel>
 <5be9d29f-08d8-40fe-adf0-7ced03303705@gmail.com>
Message-ID: <20240213-c191a5bbf346ab3ca994f464@orel>
List-Id: <opensbi.lists.infradead.org>
To: opensbi@lists.infradead.org
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit

On Mon, Feb 12, 2024 at 10:03:52PM +0000, Ivan Orlov wrote:
> On 2/12/24 17:36, Andrew Jones wrote:
> > On Thu, Feb 08, 2024 at 09:50:48AM +0000, Ivan Orlov wrote:
...
> > > +#define SBIUNIT_ASSERT(test, cond) do {						\
> > > +	if (!(cond)) {								\
> > > +		test->result = 0;						\
> > > +		SBIUNIT_INFO(test, "Condition \"" #cond "\" must be true!\n");	\
> > > +		return;								\
> > 
> > Unnecessary 'return'. It's strange that an ASSERT macro doesn't result in
> > an sbi_panic().
> > 
> 
> I thought it would be bad if test results in hang, but if it is ok I will
> rewrite it.

I think an assert should output its message and then stop all execution.
Asserts should only be used in situations where failures mean the
test programmer made an improper assumption. If we don't halt the moment
we determine the assumption is wrong, then we'll potentially generate
passing test results, but the tests may not be testing what the test
programmer thought they were.

Thanks,
drew

