

class FollowToggle {
  constructor(el){
    this.userId = el.user-id;
    this.followState = el.initial-follow-state; 
    this.el = el;
    this.render();
  }

  render() {
    if(this.followState === "unfollowed") {
      el.text("follow");
    } else {
      el.text("unfollow");
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