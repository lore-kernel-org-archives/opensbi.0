From: Ben Dooks <ben.dooks@codethink.co.uk>
Date: Tue, 17 Dec 2024 18:47:01 +0000
Subject: [RFC 5/5] scripts/carray: change to using single awk invocation
 to generate .c
In-Reply-To: <CAAhSdy0EzhGpkknusotcsudw-k_YVYKH1rTNJauiLL5WTS+jQg@mail.gmail.com>
References: <20241202110336.332490-1-ben.dooks@codethink.co.uk>
 <20241202110336.332490-6-ben.dooks@codethink.co.uk>
 <CAAhSdy0EzhGpkknusotcsudw-k_YVYKH1rTNJauiLL5WTS+jQg@mail.gmail.com>
Message-ID: <ead6e31d-896e-49d4-9cba-bcf3816911f7@codethink.co.uk>
List-Id: <opensbi.lists.infradead.org>
To: opensbi@lists.infradead.org
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit

On 15/12/2024 08:24, Anup Patel wrote:
> On Mon, Dec 2, 2024 at 4:39?PM Ben Dooks <ben.dooks@codethink.co.uk> wrote:
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
> 
> I have taken care of my comment on this patch. I also tested it
> at my end.
> 
> Applied this patch to the riscv/opensbi repo.
>

Great, thanks for sorting.

-- 
Ben Dooks				http://www.codethink.co.uk/
Senior Engineer				Codethink - Providing Genius

https://www.codethink.co.uk/privacy.html

