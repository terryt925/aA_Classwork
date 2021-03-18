class FollowToggle{
  constructor(el){
    this.el = $(el);
    this.userId = this.el.data('user-id');
    this.followState = this.el.data('initital-follow-state');
    
  }


}

module.exports = FollowToggle;