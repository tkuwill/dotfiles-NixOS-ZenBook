{
  programs.newsboat = {
    enable = true;
    autoReload = true;
    browser = "google-chrome-stable";
    extraConfig = ''
      include /nix/var/nix/profiles/system/sw/share/doc/newsboat/contrib/colorschemes/universal-color
      unbind-key j
      unbind-key J
      unbind-key k
      unbind-key K
      bind-key j down
      bind-key J next-feed
      bind-key k up
      bind-key K prev-feed 
    '';
    urls = [
      {
        tags = [ "NixOS Update" ];
        url = "https://github.com/NixOS/nixpkgs/commits/nixos-unstable.atom";
      }
      {
        tags = [ "Must Read" ];
        url = "http://feeds.feedburner.com/freegroup";
      }
      {
        tags = [ "Must Read" ];
        url = "https://alittleeditor.com/rss.xml";
      }
      {
        tags = [ "Must Read" ];
        url = "https://ivonblog.com/index.xml";
      }
      {
        tags = [ "tech" ];
        url = "https://www.macworld.com/en-us/feed";
      }
      {
        tags = [ "tech" ];
        url = "http://feeds.feedburner.com/playpc";
      }
      {
        tags = [ "tech" ];
        url = "https://www.ifanr.com/feed";
      }
      {
        tags = [ "tech" ];
        url = "https://applefans.today/feed/";
      }
      {
        tags = [ "tech" ];
        url = "https://sspai.com/feed";
      }
      {
        tags = [ "tech" ];
        url = "http://feeds.feedburner.com/mrmadtw";
      }
      {
        tags = [ "News" ];
        url = "https://www.aljazeera.com/xml/rss/all.xml";
      }
      {
        tags = [ "News" ];
        url = "http://newsrss.bbc.co.uk/rss/newsonline_world_edition/front_page/rss.xml";
      }
      {
        tags = [ "News" ];
        url = "http://www3.nhk.or.jp/rss/news/cat0.xml";
      }
      {
        tags = [ "Viewpoints" ];
        url = "https://crossing.cw.com.tw/rss";
      }
      {
        tags = [ "Viewpoints" ];
        url = "https://www.twreporter.org/a/rss2.xml";
      }

    ];
  };
}
