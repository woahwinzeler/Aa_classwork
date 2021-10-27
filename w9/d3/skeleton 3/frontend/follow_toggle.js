

class FollowToggle {
  constructor(el){
    this.userId = el.data-user-id;
    this.followState = el.data-initial-follow-state; 
    // this.el = el;
    // this.render();
    // this.handleClick()
  }

  render() {
    if(this.followState === "unfollowed") {
      this.el.text("follow");
      this.followState = 'follow';
      this.el.attr('data-initial-follow-state', 'follow');
    } else {
      this.el.text("unfollow");
      this.followState = 'unfollow';
      this.el.attr('data-initial-follow-state', 'unfollow');
    }
  }

  handleClick(e){
    e.preventDefault();

    let success = (response) => {
      this.render(); 
    }

    if (this.followState === "unfollowed")
    //AJAX request 
      $.ajax ({
        method: 'POST',
        url: `/users/${this.userId}/follow`, 
        datatype: "JSON"
      }).then(success)
    else {
      $.ajax ({
        method: 'DELETE',
        url: `/users/${this.userId}/follow`, 
        datatype: "JSON"
      }).then(success)
    }
  }

}

module.exports = FollowToggle; 