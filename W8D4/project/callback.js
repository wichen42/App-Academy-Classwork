class Clock {
    constructor() {
      // 1. Create a Date object.
      const date = new Date();
      // let time = date.getHours() + ":" + date.getMinutes() + ":" + date.getSeconds();
      // 2. Store the hours, minutes, and seconds.
      this.hour = date.getHours();
      this.minute = date.getMinutes();
      this.second = date.getSeconds();
      // 3. Call printTime.
      this.printTime()
      //printTime(this.hour, this.minute, this.second) 
      // 4. Schedule the tick at 1 second intervals.
      this._tick();
      // console.log(this);
    }
  
    printTime() {
      // Format the time in HH:MM:SS
      // Use console.log to print it.
      console.log(this.hour + ":" + this.minute + ":" +this.second);
      // this.ss++;
    }
  
    _tick() {
      // 1. Increment the time by one second.
        const callback = function() {
            this.second++;
            if (this.second > 59) {
              this.second = 0;
              this.minute++;
            }
            if (this.minute > 59) {
              this.minute = 0;
              this.hour++;
            }
            if (this.hour > 23) {
              this.hour=0;
            }
            return this.printTime();
        };
      // 2. Call printTime.

      setInterval(callback.bind(this),1000)
    }
  }
  
let current = new Clock();
current;

/* 
Array.prototype.bubbleSort = function() {
    let sorted = false;
    while(sorted === false) {
        sorted = true;
        this.forEach((ele, i) =>{
            if(ele > this[i+1]) {
                // this[i],this[i+1] = this[i+1],this[i];
                let bigger = ele;
                let smaller = this[i+1];
                this[i] = smaller;
                this[i+1] = bigger;
                sorted = false;
            }     
        })
    }
}

*/