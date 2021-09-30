From: Alistair <alistair@alistair23.me>
Date: Thu, 30 Sep 2021 10:35:16 +1000
Subject: [PATCH V2] Makefile: Add build time and compiler info string.
In-Reply-To: <CA+HMz3i6V5cpGuCZ70TknYzS2M7YkZ9+mr34_6J4vNkTtk4v_A@mail.gmail.com>
References: <20210929101945.186736-1-tekkamanninja@gmail.com>
 <CADWks+Y_7DXproeWFqjGhP+ThUyajuOP85R5t=dewOnDbaZbgg@mail.gmail.com>
 <CA+HMz3i6V5cpGuCZ70TknYzS2M7YkZ9+mr34_6J4vNkTtk4v_A@mail.gmail.com>
Message-ID: <6b98f37a-8c05-4bfd-ac37-227e4170d3fa@www.fastmail.com>
List-Id: <opensbi.lists.infradead.org>
To: opensbi@lists.infradead.org
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit

On Thu, Sep 30, 2021, at 10:23 AM, Fu Wei wrote:
> Hi Dimitri,
> 
> Great thanks for your info,  so would you mind to provide more info
> about these macro for gcc and clang ?
> 
> Dimitri John Ledkov <dimitri.ledkov@canonical.com> ?2021?9?30??? ??6:21???
> >
> > Surely one can make this reproducible.
> >
> > If using compiler builtin macro, they respect environment variable of build time.
> > Or in the make file one can use the reproducible builds timestamp environment variable (if available) and only otherwise call out date.
> >
> > Lots of other software do that already. Meaning they both encode build time, but also remain reproducible.
> 
> I guess you have seen one of them if there are lots, would you mind to
> provide a example, I am curious about "encode build time" and "remain
> reproducible" at the same time.

Yes, it is possible to include a build time in a binary and
still be reproducible. The build system can override the time
and use a constant time.

This leads to confusion though, as the build time is then
incorrect and makes packager jobs harder. The reproducible
builds group has some more information on this:
https://reproducible-builds.org/docs/timestamps/

They recommend that software doesn't include the time in the
build output. I agree with their argument that it provides
little insight for released builds while adding an overhead.

That is why this approach of allowing developers to include
it in their debug builds is a good compromise. It allows
developers to see the build time if they want, while not
complicating reproducible builds or confusing users with
strange timestamps.

Alistair

