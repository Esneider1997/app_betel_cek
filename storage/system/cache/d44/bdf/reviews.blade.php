<?php 
/* C:\xampp\htdocs\testigniter\themes\tastyigniter-orange/_pages/local\reviews.blade.php */
class Pagic63596d1e197f6824911406_86c65f6ca271e9d9a4465bb316aab03aClass extends \Main\Template\Code\PageCode
{

public function onStart()
{
    if (!View::shared('showReviews')) {
        flash()->error(lang('igniter.local::default.review.alert_review_disabled'))->now();

        return Redirect::to($this->controller->pageUrl($this['localReview']->property('redirectPage')));
    }
}

}
