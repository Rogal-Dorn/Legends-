{
  var onConnection = TacticalScreenTurnSequenceBarModule.prototype.onConnection;
  TacticalScreenTurnSequenceBarModule.prototype.onConnection = function(h)
  {
    this.mFadeInDuration = 50;
    this.mFadeOutDuration = 80;
    this.mFadeOutDurationIfHiddenToPlayer = 30;
    this.mSlideInDuration = 40;
    this.mSlideOutDuration = 90;
    this.mResizeFirstSlotTime = 80;
    this.mResizeFirstSlotImageTime = 60;
    this.mProgressbarMovementDuration = 300;
    this.mStatsPanelFadeInTime = 100;
    this.mStatsPanelFadeOutTime = 150;
    onConnection.bind(this)(h);
  }
}
