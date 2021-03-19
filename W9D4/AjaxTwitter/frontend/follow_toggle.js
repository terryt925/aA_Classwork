class FollowToggle{
  constructor(el){
    this.el = $(el);
    this.userId = this.el.data('user-id');
    this.followState = this.el.data('initital-follow-state');
    this.render();
    this.handleClick();
    //this.el.on('click', this.handleClick.bind(this))
  }

  render() { // Follow!  Unfollow!
    if(this.followState === 'followed') {
      this.el.append('Unfollow!');
    } else {
      this.el.append('Follow!')
    }
  }

  handleClick() {
    this.el.on('click', ((event)=>{
    event.preventDefault();
      if (this.followState === 'followed') {
        $.ajax({
          url:`/users/${this.userId}/follow`,
          method: 'DELETE',  
          dataType: 'JSON'
        })
      } else {
        $.ajax({
          url: `/users/${this.userId}/follow`,
          method: 'POST',
          dataType: 'JSON'
        })
      }
    }))
  }


}

// data: {
//   user: {
//     user_id: 'num'
//   }
// }




module.exports = FollowToggle;