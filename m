From: Anup Patel <anup@brainfault.org>
Date: Sun, 15 Dec 2024 13:53:45 +0530
Subject: [RFC 4/5] script/carry.sh: send error to stderr
In-Reply-To: <20241202110336.332490-5-ben.dooks@codethink.co.uk>
References: <20241202110336.332490-1-ben.dooks@codethink.co.uk> <20241202110336.332490-5-ben.dooks@codethink.co.uk>
Message-ID: <CAAhSdy3WQi1TkdLe0o2HjUYT84B11CQ_V6vF0AoqmcE-tHj7CQ@mail.gmail.com>
List-Id: <opensbi.lists.infradead.org>
To: opensbi@lists.infradead.org
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit

On Mon, Dec 2, 2024 at 4:38?PM Ben Dooks <ben.dooks@codethink.co.uk> wrote:
>
> Send the errors to stderr, otherwise they end up being
> written to the file the script was redirecting to in the
> Makefile
>
> Also, use EOF block to make it easier to redirect
>
> Signed-off-by: Ben Dooks <ben.dooks@codethink.co.uk>

Applied this patch to the riscv/opensbi repo.

Thanks,
Anup

> ---
>  scripts/carray.sh | 14 ++++++++------
>  1 file changed, 8 insertions(+), 6 deletions(-)
>
> diff --git a/scripts/carray.sh b/scripts/carray.sh
> index fb985c8..a2b05d3 100755
> --- a/scripts/carray.sh
> +++ b/scripts/carray.sh
> @@ -2,12 +2,14 @@
>
>  function usage()
>  {
> -       echo "Usage:"
> -       echo " $0 [options]"
> -       echo "Options:"
> -       echo "     -h                   Display help or usage"
> -       echo "     -i <input_config>    Input config file"
> -       echo "     -l <variable_list>   List of variables in the array (Optional)"
> +       cat <<EOF >&2
> +Usage:  $0 [options]
> +
> +Options:
> +     -h                   Display help or usage
> +     -i <input_config>    Input config file
> +     -l <variable_list>   List of variables in the array (Optional)
> +EOF
>         exit 1;
>  }
>
> --
> 2.37.2.352.g3c44437643
>
>
> --
> opensbi mailing list
> opensbi at lists.infradead.org
> http://lists.infradead.org/mailman/listinfo/opensbi

