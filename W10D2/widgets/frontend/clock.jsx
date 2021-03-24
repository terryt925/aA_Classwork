import React from 'react';

class Clock extends React.Component {
    constructor(props){
        super(props);

        this.state = {
            time: new Date()
        }
        this.tick = this.tick.bind(this)
        // this.render = this.render.bind(this)
    }
    tick() {
        this.setState({ time: new Date() })
        
    }
    
    componentDidMount(){
      this.timerId = setInterval(this.tick, 1000)   
      //this has to be () =>  this.tick(), 1000
      // or setInterval( this.tick, 1000)  ...dont envoke callback
    }  

    componentWillUnmount() {
        clearInterval(this.timerId);
    }

    render(){

        let hours = this.state.time.getHours();
        let minutes = this.state.time.getMinutes(); 
        let seconds = this.state.time.getSeconds();

        return(
            <div> 
                <h1 className='clock'>Clock</h1>
                <ul className='time'>
                    <p>Time:</p>
                    <p>{hours}:{minutes}:{seconds}</p>
                </ul>
            </div>             
        )
            
        
    }


}

export default Clock;