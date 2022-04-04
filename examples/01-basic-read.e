use GRSS::Feed::Channel;
use GRSS::Feed::Item;

my $c = GRSS::Feed::Channel.new_from_file("examples/test.rss.xml");
my $ic = 1;

for $c.fetch_all[] {

  say qq:to/ITEM/.chomp;
    ======== { $ic++ } ========
    ID:    { .get_id }
    Title: { .get_title }
    ITEM

}
