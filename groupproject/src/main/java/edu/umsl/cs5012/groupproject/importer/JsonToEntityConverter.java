package edu.umsl.cs5012.groupproject.importer;



import edu.umsl.cs5012.groupproject.entity.Product;

public class JsonToEntityConverter {

	
	public static Product convertJsonDTOToMovie(MovieJsonDTO jsonDTO) {
		Product retVal = null;
		if(jsonDTO!=null) {
			retVal = new Product();
			retVal.setImage(jsonDTO.getPoster());
			retVal.setName(jsonDTO.getTitle());
			retVal.setPartnumber(jsonDTO.getImdbID());
			retVal.setPlot(jsonDTO.getPlot());
			retVal.setRated(jsonDTO.getRated());
			retVal.setYear(jsonDTO.getYear());
			
			
			
//			retVal.setActors(jsonDTO.getActors());
//			retVal.setAwards(jsonDTO.getAwards());
//			retVal.setBoxOffice(jsonDTO.getBoxOffice());
//			retVal.setCountry(jsonDTO.getCountry());
//			retVal.setDvd(jsonDTO.getDvd());
//			retVal.setGenre(jsonDTO.getGenre());
//			retVal.setImdbID(jsonDTO.getImdbID());
//			retVal.setImdbRating(jsonDTO.getImdbRating());
//			retVal.setImdbVotes(jsonDTO.getImdbVotes());
//			retVal.setLanguage(jsonDTO.getLanguage());
//			retVal.setMetascore(jsonDTO.getMetascore());
//			retVal.setPlot(jsonDTO.getPlot());
//			retVal.setPoster(jsonDTO.getPoster());
//			retVal.setProduction(jsonDTO.getProduction());
//			retVal.setRated(jsonDTO.getRated());
//			if(jsonDTO.getRatings()!=null) {
//				//List<Rating> ratings = new ArrayList<>();
//				for(RatingsJsonDTO ratingsJsonDTO: jsonDTO.getRatings()) {
//					Rating rating = convertJsonDTOToRating(ratingsJsonDTO);
//					if(rating!=null) {
//						//ratings.add(rating);
//						retVal.addRating(rating);
//					}
//				}
//
//			}
//			
//			retVal.setReleased(jsonDTO.getReleased());
//			retVal.setResponse(jsonDTO.getResponse());
//			retVal.setRuntime(jsonDTO.getRuntime());
//			retVal.setName(jsonDTO.getName());
//			retVal.setType(jsonDTO.getType());
//			retVal.setWebsite(jsonDTO.getWebsite());
//			retVal.setWriter(jsonDTO.getWriter());
//			retVal.setYear(jsonDTO.getYear());
			
		}
		
		return retVal;
		
	}
	
//	public static Rating convertJsonDTOToRating(RatingsJsonDTO jsonDTO) {
//		Rating retVal = null;
//		if(jsonDTO!=null) {
//			retVal = new Rating();
//			retVal.setSource(jsonDTO.getSource());
//			retVal.setValue(jsonDTO.getValue());
//		}
//		return retVal;
//	}
//	
	
}
