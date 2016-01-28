'use strict';

angular.module('D3Rails')
  .factory('TechnicalWord', ['$resource' ,function ($resource) {
    return $resource('/technical_words/:id.json',{
      id: '@id'
    },{
      relation_words: {
        method: 'POST',
        url: '/technical_words/relation_words',
        params: {
          technical_word_name: '@value'
        }
      }
    });
  }]);
