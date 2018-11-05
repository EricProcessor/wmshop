<?php
class main_controller extends general_controller
{
    public function action_index()
    {
        if(is_mobile_device() && request('display') != 'pc') jump(url('mobile/main', 'index'));
        
        $vcache = vcache::instance();
        
        $this->nav = $vcache->nav_model('get_site_nav');
        
        $this->hot_searches = explode(',', $GLOBALS['cfg']['goods_hot_searches']);
        
        $this->newarrival = $vcache->goods_model('find_goods', array(array('newarrival' => 1), 50), $GLOBALS['cfg']['data_cache_lifetime']);
        
        $this->recommend = $vcache->goods_model('find_goods', array(array('recommend' => 1), 50), $GLOBALS['cfg']['data_cache_lifetime']);
        
        $this->bargain = $vcache->goods_model('find_goods', array(array('bargain' => 1), 50), $GLOBALS['cfg']['data_cache_lifetime']);
        
        $this->latest_article = $vcache->article_model('get_latest_article', array(4), $GLOBALS['cfg']['data_cache_lifetime']);
        
        $this->compiler('index.html');
    }
    
    public function action_404()
    {
        $this->compiler('404.html');
    }
    public function action_cate()
    {
        $cate_model = new goods_cate_model();
        $this->cate_list = $cate_model->goods_cate_bar();
        dump( $this->cate_list);
        //  $this->compiler('category.html');
    }
    public function action_contactus()
    {
        $this->compiler("contactus.html");
    }
    public function action_business()
    {
        $this->compiler("business.html");
    }
}