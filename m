From: Ben Dooks <ben.dooks@codethink.co.uk>
Date: Sun, 1 Dec 2024 11:12:30 +0000
Subject: [PATCH] scripts/carray: change to using single .awk script to
 generate .c
In-Reply-To: <CAAhSdy3vwJ8waRcZMiR9mCayMHYGHiPELPREBSzd=Jq9qb+J_w@mail.gmail.com>
References: <20241129100948.73391-1-ben.dooks@codethink.co.uk>
 <CAAhSdy3vwJ8waRcZMiR9mCayMHYGHiPELPREBSzd=Jq9qb+J_w@mail.gmail.com>
Message-ID: <9c9747f0-cd66-45c9-99e2-8d848da72f17@codethink.co.uk>
List-Id: <opensbi.lists.infradead.org>
To: opensbi@lists.infradead.org
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit

On 01/12/2024 11:08, Anup Patel wrote:
> On Fri, Nov 29, 2024 at 3:39?PM Ben Dooks <ben.dooks@codethink.co.uk> wrote:
>>
>> The shell script makes multiple call-outs to awk to get information
>> from the configuration file. It would be easier to just write the
>> whole thing in one .awk script and have the makefile altered to call
>> that instead.
>>
>> There should be no functional difference other than the script type
>> and has been tested with PLATFORM=generic build. This should be both
>> quicker and easier to understand.
>>
>> Signed-off-by: Ben Dooks <ben.dooks@codethink.co.uk>
>> ---
>> v2:
>>    - updated with the new bits from Samuel Holland's changes
>>    - minor tweaks to the awk script to fix the output spacing
> 
> The "./scripts/carray.awk -h" is not showing the help text.
> 
> Also, I tried compiling OpenSBI with this patch on Ubuntu 24.04
> but it does not boot because the generated C arrays are empty.

Hmm, it might be worth adding an option to warn if the lists are
zero length?

I seem to have forgotten to add -h

I'll try running it under standard awk, I think my debian install
maybe using gawk by default.

Does anyone know if awk has some way of deal with options? I couldn't
find anything that shows anything like getopt() library.

Thanks.

-- 
Ben Dooks				http://www.codethink.co.uk/
Senior Engineer				Codethink - Providing Genius

https://www.codethink.co.uk/privacy.html

