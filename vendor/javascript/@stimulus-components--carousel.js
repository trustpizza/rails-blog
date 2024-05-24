import{Controller as t}from"@hotwired/stimulus";import e from"swiper/bundle";const s=class _Carousel extends t{connect(){this.swiper=new e(this.element,{...this.defaultOptions,...this.optionsValue})}disconnect(){this.swiper.destroy(),this.swiper=void 0}get defaultOptions(){return{}}};s.values={options:Object};let i=s;export{i as default};

