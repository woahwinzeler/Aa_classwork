

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

}

module.exports = FollowToggle; 