

class FollowToggle {
  constructor(el){
    //error is coming from the 2 lines below 
    this.$el = $(el);
    this.userId = this.$el.data('user-id');
    this.followState = this.$el.data('initial-follow-state'); 
    this.render();
    this.$el.on('click', this.handleClick.bind(this));
  }

  render() {
    debugger 
    //this.followState is a boolean
    if(this.followState) {
      this.$el.text("unfollow");
      // this.followState = 'follow';
      // this.$el.attr('data-initial-follow-state', 'follow');
    } else {
      this.$el.text("follow");
      // this.followState = 'unfollow';
      // this.$el.attr('data-initial-follow-state', 'unfollow');
    }
  }

  handleClick(e){
    debugger 
    e.preventDefault();
    let that = this;
    let successfulUnfollow = (response) => {
      console.log(response)
      console.log("Unfollow")
      that.followState = "unfollow"
      that.$el.data('initial-follow-state', false);
      that.render(); 
    }
    let successfulFollow = (response) => {
      console.log(response)
      console.log("Follow")
      that.followState = "follow"
      that.$el.data('initial-follow-state', true);
      that.render(); 
    }

    if (!this.followState){
    //AJAX request 
      debugger 
      $.ajax ({
        method: 'POST',
        url: `/users/${this.userId}/follow`, 
        datatype: "JSON"
      }).then(successfulFollow)
    } 
    else {
      $.ajax ({
        method: 'DELETE',
        url: `/users/${this.userId}/follow`, 
        datatype: "JSON"
      }).then(successfulUnfollow)
    }
  }
  

}

module.exports = FollowToggle; 